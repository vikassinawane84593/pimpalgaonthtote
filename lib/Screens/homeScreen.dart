import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/Complaintscreen.dart';
import 'package:pimpalgaonthote/Screens/contact_Screen.dart';
import 'package:pimpalgaonthote/Screens/notisescreen.dart';
import 'package:pimpalgaonthote/Screens/timetableascreen.dart';
import 'package:pimpalgaonthote/Screens/village_gallary.dart';
import 'package:pimpalgaonthote/Screens/village_official.dart';
import 'package:pimpalgaonthote/Widgets/Jalad_seva.dart';
import 'package:pimpalgaonthote/Widgets/village_official_widget.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';
import 'package:pimpalgaonthote/model/officialmodel.dart';
import 'package:pimpalgaonthote/model/weathermodel.dart';
import 'package:pimpalgaonthote/servieces/wetherData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColour.ScafffolBackgroundcolour,

      appBar: AppBar(

        title: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'पिंपळगांव थोटे',
                style: Theme.of(context).textTheme.headlineMedium,


              ),
            ),

            Text(
              'आपण मिळून अधिक चांगलं गाव घडवतो',
              style: Theme.of(context).textTheme.titleMedium,


            ),
          ],
        ),
        centerTitle: true,
        actions: [

          StreamBuilder< DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),

            builder: (context, userSnapshot) {

              if (!userSnapshot.hasData) {
                return const SizedBox();
              }


              final userData =  userSnapshot.data!.data();

              final Timestamp? lastReadAt = userData?['lastReadAt'];





              return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: lastReadAt == null
                    ? FirebaseFirestore.instance
                    .collection('warnings')
                    .snapshots()

                    : FirebaseFirestore.instance
                    .collection('warnings')
                    .where('createdAt', isGreaterThan: lastReadAt,).snapshots(),

                builder: (context, warningSnapshot) {

                  if (!warningSnapshot.hasData) {
                    return const SizedBox();
                  }


                  final count =
                      warningSnapshot.data!.docs.length;

                  return Stack(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(right: 8),

                        child: IconButton(
                          onPressed: () async {


                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => NoticeScreen(),
                              ),
                            );

                            final user =
                                FirebaseAuth.instance.currentUser;

                            if (user == null) {
                              return;
                            }

                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(user.uid)
                                .set({
                              'lastReadAt': FieldValue.serverTimestamp(),
                            }, SetOptions(merge: true));


                          },

                          icon: const Icon(
                            Icons.notifications_none_outlined,
                            size: 34,
                          ),
                        ),
                      ),

                      if (count > 0)
                        Positioned(
                          right: 14,
                          top: 0,
                          child: Container(
                            height: 19,
                            width: 19,

                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),

                            child: Center(
                              child: Text(
                                '$count',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              );

            },
          )
        ],
      ),

      body: Column(

        children: [

          SizedBox(
            height: 10,
          ),
          FutureBuilder  (
              future: getcurrentWether(),
              builder: (context, asyncSnapshot) {

                late WeatherModel weatherdata;



                if (asyncSnapshot.hasError) {
                  weatherdata  = WeatherModel(
                    temperature: 34.0,
                    icon: Icons.wb_sunny,
                    weatherText: 'ऊन आहे',
                    greeting: 'शुभ संध्याकाळ',
                  );

                }

                else if(asyncSnapshot.connectionState == ConnectionState.waiting){

                  weatherdata = WeatherModel(
                    temperature: 34.0,
                    icon: Icons.wb_sunny,
                    weatherText: 'ऊन आहे',
                    greeting: 'शुभ संध्याकाळ',
                  );


                }

                else {
                  weatherdata = asyncSnapshot.data!;


                }

                final double tempreture = weatherdata.temperature;
                final IconData icon = weatherdata.icon;
                final String weatheratext = weatherdata.weatherText;
                final String greeting = weatherdata.greeting;

                return Stack(
                    children: [

                      //image
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          decoration: AppTheme.container,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'Assets/welcomepagephoto.png',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),


                      //weather
                      Padding(
                        padding: const EdgeInsets.only(right: 16, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(icon, color: Colors.orangeAccent,),

                                SizedBox(width: 5,),

                                Text(
                                  tempreture.toString(),
                                  style: TextStyle(
                                      color: AppColour.textScondary
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              width: 80,
                              child: Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  weatheratext,
                                  style: TextStyle(
                                      color: AppColour.textScondary
                                  ),)
                              ],
                            )
                          ],
                        ),
                      ),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(top: 120, left: 20),
                            child: Text(
                              greeting,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [

                                Icon(
                                  Icons.location_on,
                                  color: Colors.orangeAccent,
                                ),

                                Text(
                                  'पिंपळगाव थोटे',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ]
                );

              }
          ),

          //जलद सेवा' quick access

          Padding(
            padding: EdgeInsetsGeometry.only(left: 10,top: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                  'जलद सेवा',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8,right: 15,left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                JaladSeva(
                  title: 'वेळापत्रक',
                  subtitle: 'गावाचे वेळापत्रक',
                  icon: Icons.newspaper_sharp,
                  colour: Color(0xFFE0EDE5,),
                  iconcolour: Color(0xFF3F8551,),
                  Ontap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_)=>TimeTAbleScreen()
                    ));
                  },
                ),

                SizedBox(width: 10,),

                JaladSeva(
                  title: 'तक्रार',
                  subtitle: 'समस्या नोंदवा',
                  icon: Icons.warning_amber_rounded,
                  colour:Color(0xFFE4D8D1,)
                  , iconcolour: Color(0xFFCC7B43,),
                  Ontap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_)=>ComplaintScreen()
                    ));
                  },
                ),

                SizedBox(width: 10),

                JaladSeva(
                  title: 'गॅलरी',
                  subtitle: 'गावातील क्षण',
                  icon: Icons.image,
                  colour:  Color(0xFFE0EDE5,),
                  iconcolour: Color(0xFF3F8551,),
                  Ontap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_)=>VillageGallary()));

                  },
                ),

                SizedBox(width: 10,),

                JaladSeva(
                  title: 'निर्देशिका',
                  subtitle: 'महत्त्वाचे संपर्क',
                  icon: Icons.perm_contact_cal_sharp,
                  colour: Color(
                    0xFFE4EBF1,), iconcolour: Color(0xFF5E9EE4,),
                  Ontap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_)=>ContactScreen())
                    );
                  },
                )

              ],
            ),
          ),

          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  margin: EdgeInsetsGeometry.only(left: 14,right: 14),

                  width: double.infinity,
                  decoration: AppTheme.container.copyWith(borderRadius: BorderRadius.circular(10)),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8,top: 6,bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              'गाव अधिकारी',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),

                            Padding(
                              padding: EdgeInsetsGeometry.only(left: 120),
                              child: TextButton(

                                  onPressed: (){

                                    Navigator.push(
                                        context, MaterialPageRoute(
                                        builder: (_)=>Vilageofficial()
                                    ));
                                  },

                                  child: Text(
                                    'संपूर्ण माहिती →',
                                    style: TextStyle(
                                        color: Colors.orange.shade700
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),

                      Expanded(
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('officials').snapshots(),
                            builder: (context, asyncSnapshot) {

                              if(asyncSnapshot.connectionState == ConnectionState.waiting){
                                return Center(child: CircularProgressIndicator(color: Colors.black,));
                              }

                              if(asyncSnapshot.hasError){
                                return Center(
                                  child: Text('Error: ${asyncSnapshot.error}'),
                                );
                              }



                              final doc = asyncSnapshot.data!.docs;

                              if(doc.isEmpty){
                                return Center(
                                  child: Text('ग्राम अधिकाऱ्यांची माहिती उपलब्ध नाही'),
                                );
                              }


                              return ListView.builder(
                                  itemCount:
                                  doc.length>3
                                      ?3
                                      :doc.length,
                                  itemBuilder: (contex ,index ){
                                    final data = doc[index].data();
                                    OfficialModel officialModel = OfficialModel.fromMap(data);
                                    return OfficialCard(

                                      //imageUrl:  'https://picsum.photos/300/30$index',
                                      //name: grampanchyatdata[index]['name'],
                                      //post: grampanchyatdata[index]['post'],
                                      //department: grampanchyatdata[index]['department'],
                                        officialModel:officialModel ,
                                        onCall: (){}
                                    );
                                  });
                            }
                        ),
                      )
                    ],
                  ),
                )

            ),
          ),





        ],
      ),

    );
  }
}
