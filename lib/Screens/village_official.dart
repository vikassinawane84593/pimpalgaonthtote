import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Widgets/village_official_widget.dart';
import 'package:pimpalgaonthote/data.dart';
import 'package:pimpalgaonthote/model/officialmodel.dart';

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
              ),


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

              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('officials').snapshots(),
                  builder: (context, asyncSnapshot) {
                    final doc = asyncSnapshot.data!.docs;

                    return ListView.builder(
                        itemCount: doc.length,
                        itemBuilder: (contex ,index ){
                          final data = doc[index].data();
                          OfficialModel officermodel = OfficialModel.fromMap(data);
                          return OfficialCard(
                    
                              //imageUrl:  'https://picsum.photos/300/30$index',
                              //name: grampanchyatdata[index]['name'],
                              //post: grampanchyatdata[index]['post'],
                              //department: grampanchyatdata[index]['department'],
                            officialModel: officermodel,

                              onCall: (){}
                    
                          );
                    
                        });
                  }
                ),
              )


            ]
        )
    );

  }
}
