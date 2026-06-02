import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';
import 'package:pimpalgaonthote/core/Widgets/build_Tile.dart';
import 'package:pimpalgaonthote/core/Widgets/build_divider.dart';
import 'package:pimpalgaonthote/servieces/image_picker_servise.dart';
import 'package:pimpalgaonthote/servieces/profile_servise.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  File? image;

  ImagePickerServise imagepickerservise =ImagePickerServise();
  ProfileServise profileServise = ProfileServise();

@override
  void initState() {
    super.initState();
    image = File(profileServise.getpath()!);

}

  Future<void>onpress() async{

    final  File? pickedImage = await imagepickerservise.imagePickerFun();

    if(pickedImage!= null){

      await profileServise.savepath(pickedImage.path);

      setState(() {

        image = File(profileServise.getpath()!);

      });
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
                      backgroundImage: image != null
                        ?FileImage(image!)
                        :null,//AssetImage("Assets/vikas.jpg"),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 90,top: 100),

                        child: IconButton(
                            onPressed: onpress,
                            icon: Icon(
                              Icons.add_a_photo,
                              color: AppColour.Iconbuttoncolour,
                            )),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),


                Expanded(
                    child:Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: AppTheme.container,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [

                              BuildTile(icon: Icons.person, title: "Name", value: "Ramesh Kumar"),
                              BuildDivider(),

                              //buildTile(context,Icons.calendar_today, "Age", "27 Years"),
                              BuildTile(icon: Icons.calendar_today, title: 'Age', value: '27 Years'),
                              BuildDivider(),

                             // buildTile(context,Icons.work, "Work", "Farmer"),

                              BuildTile(icon: Icons.work, title: 'Work', value: 'Farmer')
                            ],
                          ),
                        ),
                      ),

                  ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
