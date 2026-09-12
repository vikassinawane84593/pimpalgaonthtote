import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {

  final String name;
  final String number;

  const ContactWidget({
    super.key,
    required this.name,
    required this.number
  });

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.symmetric(horizontal: 18),
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),

          ),

          subtitle: Text(
              number
          ),

          trailing: Icon(
            Icons.person,

          ),
        ),
      ),
    );
  }
}
