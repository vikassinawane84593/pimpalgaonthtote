import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';

class Timetelingwidget extends StatelessWidget{
  final String day;
  final String starttime;
  final String endtime;

  const Timetelingwidget({
    super.key,
    required this.day,
    required this.starttime,
    required this.endtime
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 8,left: 9,right: 9),
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
                  day,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Icon(
                            Icons.watch_later_outlined,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Text(
                          '$starttime AM',
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
                      ' $endtime PM',
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
    );
  }
}
