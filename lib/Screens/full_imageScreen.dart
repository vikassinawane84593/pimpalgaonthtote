import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  final String imageUrl;
  final String Title;

  const FullImageScreen({
    super.key,
    required this.imageUrl,
    required this.Title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(Title),

        titleTextStyle: TextStyle(

          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),

        centerTitle: false,


      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(
            height: double.infinity,

            width: double.infinity,

            fit: BoxFit.cover,
              imageUrl),
        ),
      ),
    );
  }
}