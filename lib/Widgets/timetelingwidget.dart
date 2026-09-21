import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';

class Timetelingwidget extends StatelessWidget{

  final String day;
  final String starttime;
  final String endtime;
  final MaterialColor  colors;
  final IconData icons;

  const Timetelingwidget({

    super.key,
    required this.day,
    required this.starttime,
    required this.endtime,
    required this.colors,
    required this.icons

});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 19,left: 9,right: 9),
      child: Container(

        decoration:AppTheme.container.copyWith(

            borderRadius: BorderRadius.circular(8),
            boxShadow: [],
            border: BoxBorder.all(
                color: colors
            ),
            color:colors.shade50
        ),

        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 6,top: 10,bottom: 10),
              child: CircleAvatar(
                backgroundColor: colors.shade100,
                radius: 50,
                child: Icon(
                  icons,
                  size: 80,
                  color: colors,
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
                      color: colors

                  ),
                ),

                Text(
                  '(उपलब्ध वेळ)',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: colors
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                decoration:AppTheme.container.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [],
                    border: BoxBorder.all(
                        color: colors
                    ),
                    color: colors.shade50
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsGeometry.only(top: 10,left: 7,right: 6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1,right: 6),
                            child: Icon(
                              Icons.watch_later_outlined,
                              color: colors,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5,right: 5),
                            child: Text(
                              '$starttime',
                              style: TextStyle(
                                  color: colors,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                        'ते',
                        style: TextStyle(
                          color: colors,
                          fontWeight: FontWeight.bold,


                        )
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                          ' $endtime',
                          style: TextStyle(
                              color: colors,
                              fontWeight: FontWeight.bold,
                              fontSize: 17

                          )
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
