import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Widgets/contact_widget.dart';
import 'package:pimpalgaonthote/model/contactmodel.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

String serchtext= '';
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
                    onChanged: (valuse){
                      setState(() {
                        serchtext= valuse;

                      });
                  }


                  ),


                ),
              ),

              StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('contacts').snapshots(),
                  builder: (context,snapshot){



                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text("Error"));
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Text("No contacts found");
                    }
                    final contacts = snapshot.data!.docs.where((doc){
                      final data = doc.data() ;
                      final name = data ['name'].toString().toLowerCase();
                      final post = data ['post'].toString().toLowerCase();
                      final mobile = data ['mobile'].toString().toLowerCase();
                      final searchLower = serchtext.toLowerCase();
                      return name.contains(searchLower) ||
                          post.contains(searchLower) ||
                          mobile.contains(searchLower);
                    }).toList();

                    return Expanded(
                      child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          final Contactmodel data  = Contactmodel.fromMap(contacts[index].data());
                          final name = data.name;
                          final post = data.tag;
                          final mobile = data.number;
                          return ContactWidget(
                              name: name,
                              number: mobile,
                              tag: post);
                        },
                      ),
                    );



                  })

            ]
        )
    );

  }
}
