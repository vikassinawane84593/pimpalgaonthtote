import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';

class BuildTile extends StatelessWidget {
  final IconData icon;
  final String  title;
  final String value;

   const BuildTile({

     super.key,
     required this.icon,
     required this.title,
     required this.value

  });

  @override
  Widget build(BuildContext context) {
    return   ListTile(
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
}
