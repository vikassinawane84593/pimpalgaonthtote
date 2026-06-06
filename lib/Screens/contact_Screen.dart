import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Widgets/contact_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Column(
            children: [
              Text('गावातील संपर्क'),

              Text(
                  'गावातील लोकांशी संपर्कात रहा',
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
                      hintText: 'संपर्क शोधा...',
                      prefixIcon: Icon(Icons.search),
                    ),



                  ),


                ),
              ),
              
              ContactWidget(name: 'vikas', number: '8459i93456')
            ]
        )
    );

  }
}
