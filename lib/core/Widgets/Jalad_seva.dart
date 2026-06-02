import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';

class JaladSeva extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color colour;
  final Color iconcolour;

  const JaladSeva({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colour,
    required this.iconcolour
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.only(top: 10),
      alignment: Alignment.topCenter,
      width: 81,
      height: 110,
      decoration:AppTheme.container.copyWith(borderRadius: BorderRadius.circular(10),),
      child: Column(
        children: [
          Container(
            width:50 ,
            height: 50,
            decoration: AppTheme.container.copyWith(
                color:colour,
                boxShadow: [],
                borderRadius: BorderRadius.circular(9)
            ),
            child: Icon(
              icon,size: 34,
              color: iconcolour,
            ),

          ),

          Padding(
            padding: const EdgeInsetsGeometry.only(top: 4),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Text(subtitle,
            style: TextStyle(
                fontSize: 10
            ),)
        ],
      ),
    );
  }
}
