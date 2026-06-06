import 'package:flutter/material.dart';

class Gridv extends StatelessWidget {
  const Gridv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){

          return SizedBox(
            height: 100,
            width: 100,
            child: Card(
            color: Colors.red,

              child: Center(
                child: Text('$index'),
              ),
            ),
          );

          },
    )
    );
  }
}
