import 'package:flutter/material.dart';

class Newscardwidget extends StatelessWidget {

  final String networkimage;
  final String title;
  final String subtitle;
  final String time;

   const Newscardwidget({
    super.key,
    required this.networkimage,
    required this.title,
     required this.subtitle,
    required this.time,

  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(18),
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                networkimage,
                height: 120,
                width:double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Text(
                  subtitle              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 8,top: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month,

                    color: Colors.grey,

                  ),

                  SizedBox(
                    width: 10,
                  ),

                  Text(time,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  )


                ],
              ),
            ),
          ]
      ),

    );
  }
}
