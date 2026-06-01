import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('ग्रामवार्ता'),

      ),

      body: Column(
        children: [
          Padding(
            
            padding: const EdgeInsets.all(8.0),
            
            child: Card(
              
              elevation: 4,
              
              child: TextFormField(
                
                decoration: InputDecoration(
                  hintText: 'बातम्या शोधा...',
                  prefixIcon: Icon(Icons.search)
                )

              ),
            ),
          )
        ],
      ),
    );
  }
}
