import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';

Widget buildTile(BuildContext context,IconData icon, String title, String value) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: AppColour.iconbackgroundcolour,
      child: Icon(icon, color:AppColour.iconcolour,),
    ),
    title: Text(
      title,
      style: const TextStyle(color: Colors.grey),
    ),
    subtitle: Text(
      value,
      style: Theme.of(context).textTheme.headlineSmall
    ),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
  );
}


Widget buildDivider() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Divider(),
  );
}

// Jalad seva
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


