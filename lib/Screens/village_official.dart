import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Widgets/contact_widget.dart';
import 'package:pimpalgaonthote/core/Widgets/village_official_widget.dart';

class Vilageofficial extends StatefulWidget {
  const Vilageofficial({super.key});

  @override
  State<Vilageofficial> createState() => _VilageofficialState();
}

class _VilageofficialState extends State<Vilageofficial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Column(
            children: [
              Text('ग्राम अधिकारीक'),

              Text(
                ' ग्रामपंचायत पिंपळगाव थोटे',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87
                ),
              )
            ],
          ),
          centerTitle: true,
        ),

        /*Card(
          child: ListTile(
            title: Text('Vikas Sonawane'),

            subtitle: Text('8459360064'),

            trailing: Icon(
                Icons.person
            ),
          ),
        );*/
        body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(

                  elevation: 4,

                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: 'ग्राम अधिकारी शोधाा...',
                      prefixIcon: Icon(Icons.search),
                    ),



                  ),


                ),


                                
              ),


            ]
        )
    );

  }
}
