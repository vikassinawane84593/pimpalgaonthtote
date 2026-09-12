import 'package:flutter/material.dart';

class Timetablewidget extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback ontaps;

  const Timetablewidget({

    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.ontaps

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
          onTap: ontaps,
          child: SizedBox(
            height: 100,
            child: Card(
                elevation: 3,

                child:Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.green[100],
                          child:Icon(
                            icon,
                            size: 35,
                            color: Colors.orangeAccent ,)
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(

                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19
                            ),
                          ),

                          Text(subtitle),

                        ],
                      ),

                    ),

                    Padding(

                      padding: const EdgeInsets.only(left: 135),
                      child: Icon(Icons.arrow_forward_ios_sharp),

                    )

                  ],
                )
            ),
          ),
        )
    );
  }
}
