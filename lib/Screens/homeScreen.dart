import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';
import 'package:pimpalgaonthote/core/Widgets/Jalad_seva.dart';
import 'package:pimpalgaonthote/core/Widgets/latest_news.dart';
import 'package:pimpalgaonthote/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> pickimage() async {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColour.ScafffolBackgroundcolour,

      appBar: AppBar(

        title: Column(
          children: [
            Text(
              'पिंपळगांव थोटे',
            ),
            Text(
              'आपण मिळून अधिक चांगलं गाव घडवतो',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black
                ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 8),
            child: Icon(Icons.notifications_none_outlined),
          )
        ],
      ),

      body: Column(
        children: [
           Stack(
             children: [

               //image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
               child: Container(
                 decoration:AppTheme.container,
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
               padding: const EdgeInsets.only(right: 16,top: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.end,                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Icon(Icons.sunny,color: Colors.orangeAccent,),

                         Text(
                           '42°C',
                           style: TextStyle(
                             color: AppColour.textScondary
                           ),
                         ),
                       ],
                     ),

                     SizedBox(
                       width: 50,
                       child: Divider(
                         color: Colors.black,
                         thickness: 1,
                       ),
                     ),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text(
                             'ऊन आहे',
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
                     padding: const EdgeInsets.only(top: 120,left: 20),
                     child: Text(
                         'शुभ सकाळ!',
                     style: TextStyle(
                      color: Colors.white,
                       fontSize: 19,
                       fontWeight: FontWeight.bold
                     ),
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.only(left: 20,top: 10),
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
                JaladSeva(title: 'बातम्या', subtitle: 'ताज्या घडामोडी', icon: Icons.newspaper_sharp, colour: Color(0xFFE0EDE5,),iconcolour: Color(0xFF3F8551,)),
                
                SizedBox(width: 10,),
                
                JaladSeva(title: 'तक्रार', subtitle: 'समस्या नोंदवा', icon: Icons.warning_amber_rounded, colour:Color(0xFFE4D8D1,) , iconcolour: Color(0xFFCC7B43,)),
                
                SizedBox(width: 10),
                
                JaladSeva(title: 'सेवा', subtitle: 'सर्व सेवा', icon: Icons.groups, colour:  Color(0xFFE0EDE5,), iconcolour: Color(0xFF3F8551,)),
                
                SizedBox(width: 10,),
                
                JaladSeva(title: 'निर्देशिका', subtitle: 'महत्त्वाचे संपर्क', icon: Icons.perm_contact_cal_sharp, colour: Color(
                  0xFFE4EBF1,), iconcolour: Color(0xFF5E9EE4,))
                
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
                          child: Text(
                            'ताज्या घडामोडी',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),

                        Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                              itemBuilder: (contex ,index ){
                              return Latestnews(
                                  chiptitle: data[index]['chiptitle'],
                                  title: data[index]['title'],
                                  info: data[index]['info'],
                                  time: data[index]['time'],
                                  imagepath: data[index]['imagepath']);

                              }),
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
