import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pimpalgaonthote/Widgets/build_divider.dart';
import 'package:pimpalgaonthote/Widgets/build_tile.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';
import 'package:pimpalgaonthote/model/profiledata.dart';

import 'package:pimpalgaonthote/servieces/image_picker_servise.dart';
import 'package:pimpalgaonthote/servieces/profile_servise.dart';
import 'package:pimpalgaonthote/servieces/uploadcoundery.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  ImagePickerServise imagepickerservise =ImagePickerServise();
  ProfileServise profileServise = ProfileServise();

  File? localImage;
  String? firebaseImageUrl;

  bool isbool = false;

@override
  void initState() {
    super.initState();
    loadProfileImage();
}

  /*Future<void>onpress() async{

    final  File? pickedImage = await imagepickerservise.imagePickerFun();

    if(pickedImage!= null){

      setState(() {
        isbool = true;
      });
      await profileServise.savepath(pickedImage.path);

      final  data  = await uploadToCloudinary(XFile(pickedImage.path));
      final url = data['url'];


      final uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance .collection('users')
          .doc(uid)
          .update({ 'photoUrl': url, });

      setState(() {

        isbool = false;

        firebaseImageUrl = url;
        localImage= pickedImage;

      });
    }

  }*/
  Future<void> onpress() async {
    final File? pickedImage =
    await imagepickerservise.imagePickerFun();

    if (pickedImage == null) {
      return;
    }

    setState(() {
      isbool = true;
    });

    try {
      // 1. Hive मध्ये save
      await profileServise.savepath(pickedImage.path);

      // 2. Cloudinary upload
      final data = await uploadToCloudinary(
        XFile(pickedImage.path),
      );

      final String url = data['url'].toString();

      // 3. Firebase मध्ये URL save
      final uid =
          FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
        'photoUrl': url,
      });

      // 4. सर्व process पूर्ण झाल्यावरच UI update
      if (!mounted) return;

      setState(() {
        isbool = false;
        firebaseImageUrl = url;
        localImage = pickedImage;
      });

    } catch (e) {
      if (!mounted) return;

      setState(() {
        isbool = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image upload failed: $e'),
        ),
      );
    }
  }

  Future<void> loadProfileImage() async {

    final path = profileServise.getpath();

    if (path != null && path.isNotEmpty) {
      setState(() {
        localImage = File(path);
      });
      return;
    }
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    final data = doc.data();

    if (data != null) {

      final url = data['photoUrl'];

      if (url != null && url.toString().isNotEmpty) {
        setState(() {
          firebaseImageUrl = url.toString();
        });
        return;
      }
    }



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColour.ScafffolBackgroundcolour,
      body: SafeArea(
        child: Stack(
          children: [

            // Background Image
            Container(
              height: 290,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage("Assets/welcomepagephoto.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Column(
              children: [

                const SizedBox(height: 130),

                Center(
                  child: CircleAvatar(
                    radius: 85,
                    backgroundColor: AppColour.primary,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: firebaseImageUrl != null
                        ?NetworkImage(firebaseImageUrl!)
                        :localImage!=null
                          ?FileImage(localImage!)
                          :null

                      ,//AssetImage("Assets/vikas.jpg"),
                      child: isbool
                        ?Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                      :Padding(
                        padding: const EdgeInsets.only(left: 90,top: 100),

                        child: IconButton(
                            onPressed: onpress,
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),


                Expanded(
                    child:FutureBuilder(
                      future: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get(),
                      builder: (context, asyncSnapshot) {
                            if(asyncSnapshot.connectionState == ConnectionState.waiting){
                              return Center(
                                  child: CircularProgressIndicator()
                              );
                            }

                            if(asyncSnapshot.hasError){

                              return Center(
                                child: Text('${asyncSnapshot.error}')
                              );

                            }

                            if(!asyncSnapshot.hasData){
                              return Center(
                                child: Text('NO INFORMATION AVAIBLE'),
                              );

                            }

                            final data = asyncSnapshot.data!.data();

                            if(data==null){
                              return Center(
                                child: Text('NO INFORMATION AVAIBLE'),
                              );

                            }

                            final profileModel model = profileModel.fromMap(data);

                            final String  name = model.name;
                            final String age = model.age!;
                            final String work = model.profession;

                            return Container(
                                margin: const EdgeInsets.symmetric(horizontal: 16),
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                decoration: AppTheme.container,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [

                                      BuildTile(icon: Icons.person, title: "Name", value: name),
                                      BuildDivider(),

                                      //buildTile(context,Icons.calendar_today, "Age", "27 Years"),
                                      BuildTile(icon: Icons.calendar_today, title: 'Age', value: age),
                                      BuildDivider(),

                                     // buildTile(context,Icons.work, "Work", "Farmer"),

                                      BuildTile(icon: Icons.work, title: 'Work', value: work)
                                    ],
                                  ),
                                ),
                              );
                          }






                    ),


  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
