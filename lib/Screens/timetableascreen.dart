import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/Lighttimetable.dart';
import 'package:pimpalgaonthote/core/Widgets/timetablewidget.dart';

class TimeTAbleScreen extends StatefulWidget{
  const TimeTAbleScreen({super.key});

  @override
  State<TimeTAbleScreen> createState() => _TimeTAbleScreenState();
}

class _TimeTAbleScreenState extends State<TimeTAbleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Column(
            children: [
              Text('गावाचे वेळापत्रक'),

              Text(
                'गावाचे वेळापत्रका',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87
                ),
              )
            ],
          ),
          centerTitle: true,
        ),

        body:Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16,top: 16),
              child: Text(
                'उपलब्ध वेळापत्रक',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            Timetablewidget(
                icon: Icons.lightbulb_outline_sharp,
                title: 'वीज वेळापत्रक',
                subtitle: 'वीज पुरवठा वेळापत्रक',
              ontaps: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Lighttimetable()
                    )
                );
              }
            ),

          ],
        )

    );
  }
}
