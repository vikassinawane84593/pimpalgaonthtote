import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

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
                style: TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
                 color: AppColour.text
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsetsGeometry.only(top: 10),
                  alignment: Alignment.topCenter,
                  width: 90,
                  height: 110,
                  decoration:AppTheme.container.copyWith(borderRadius: BorderRadius.circular(10),),
                  child: Column(
                    children: [
                      Container(
                        width:50 ,
                        height: 50,
                        decoration: AppTheme.container.copyWith(
                          color:Color(0xFF98C5EA),
                          boxShadow: [],
                          borderRadius: BorderRadius.circular(9)
                        ),
                        child: Icon(
                          Icons.newspaper_outlined,size: 34,
                        ),

                      ),
                      
                      Padding(
                        padding: const EdgeInsetsGeometry.only(top: 4),
                        child: Text(
                          'News',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      
                      Text('Latest Update',
                      style: TextStyle(
                        fontSize: 10
                      ),)
                    ],
                  ),
                )
              ],
            ),
          )


        ],
      ),

    );
  }
}
