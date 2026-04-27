import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';

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
