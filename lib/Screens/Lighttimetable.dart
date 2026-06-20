import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';

class Lighttimetable extends StatefulWidget {
  const Lighttimetable({super.key});

  @override
  State<Lighttimetable> createState() => _LighttimetableState();
}

class _LighttimetableState extends State<Lighttimetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
        title: Column(
          children: [
            Text('वीज पुरवठा वेळापत्रक'),

            Text(
              'पिंपळगाव थोटे',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87
              ),
            ),


          ],
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(
            height: 100,
            width:double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green[100],
                        child: Icon(
                          Icons.calendar_month
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsetsGeometry.only(top: 15,left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'कालावधी',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                            ),


                          ),

                          Text(
                              '१ जून २०२६ ते १ जुलै २०२६',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),

                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.green,
                ),
              ),
            ),

            Text(
              'वीज पुरवठा वेळापत्रक',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),

            ),

            Expanded(
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Divider(
                    color: Colors.green,

                    ),
                ),
                )
          ],
        ),

          Padding(
            padding: const EdgeInsets.only(
              top: 8,left: 9,right: 9
            ),
            child: Container(
              decoration:AppTheme.container.copyWith(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [],
                border: BoxBorder.all(
                  color: Colors.orange
                ),
                color: Colors.orange.shade50
              ),
                child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 6,top: 10,bottom: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.orange.shade100,
                      radius: 50,
                      child: Icon(
                        Icons.sunny,
                        size: 80,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'दिवसा',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.orange

                        ),
                      ),

                      Text(
                        '(वीज उपलब्ध वेळ)',
                        style: TextStyle(
                           // fontWeight: FontWeight.bold,
                            fontSize: 18,
                          color: Colors.orange
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration:AppTheme.container.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [],
                        border: BoxBorder.all(
                            color: Colors.orange
                        ),
                        color: Colors.orange.shade50
                    ),
                    child: Column(
                      children: [
                       Padding(
                         padding: const EdgeInsetsGeometry.only(top: 10,left: 7,right: 6),
                         child: Row(
                           children: [
                             Icon(
                               Icons.watch_later_outlined,
                               color: Colors.orangeAccent,
                             ),
                             Text(
                                 '06:00 AM',
                               style: TextStyle(
                                 color: Colors.orangeAccent,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 17
                               ),
                             )
                           ],
                         ),
                       ),
                        Text(
                            'to',
                            style: TextStyle(
                                color: Colors.orangeAccent,
                              fontWeight: FontWeight.bold,


                            )
                        ),

                        Text(
                            '12:00 PM',
                            style: TextStyle(
                                color: Colors.orangeAccent,
                              fontWeight: FontWeight.bold,
                                fontSize: 17

                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),


    );
  }
}
