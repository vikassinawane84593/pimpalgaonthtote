import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Widgets/timetelingwidget.dart';

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


            Timetelingwidget(

              day: 'दिवसा',
              starttime: '06:00',
              endtime: '06:00',
              colors: Colors.orange,
              icons:Icons.sunny

            ),
            
            Timetelingwidget(
                day: 'night',
                starttime: '02:00',
                endtime: '09:00',
                colors: Colors.blue,
              icons: Icons.nightlight_round,
            )



          ]
      ),
    );
  }
}
