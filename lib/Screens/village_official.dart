import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Widgets/village_official_widget.dart';
import 'package:pimpalgaonthote/model/officialmodel.dart';

class Vilageofficial extends StatefulWidget {
  const Vilageofficial({super.key});

  @override
  State<Vilageofficial> createState() => _VilageofficialState();
}

class _VilageofficialState extends State<Vilageofficial> {

  String _serchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Column(
            children: [
              Text('ग्राम अधिकारी'),

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

                    onChanged: (value){
                      setState(() {
                        _serchText = value;
                      });
                    },



                  ),




                ),


                                
              ),

              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('officials').snapshots(),
                  builder: (context, asyncSnapshot) {

                    if (asyncSnapshot.hasError){
                      return Center(
                        child: Text('dont find contact'),
                      );
                    }

                    if(asyncSnapshot.connectionState==ConnectionState.waiting){

                      return Center(
                        child:CircularProgressIndicator(),
                      );
                    }


                    final allDoc = asyncSnapshot.data!.docs;

                    final allModelData = allDoc.map((doc){
                      final data = doc.data();

                      return OfficialModel.fromMap(data);
                    }).toList();


                    final searcheddata = allModelData.where((doc){

                      final name = doc.name.toUpperCase();
                      final post = doc.post.toUpperCase();

                      return name.contains(_serchText.toUpperCase()) || post.contains(_serchText.toUpperCase());


                    }).toList();

                    if (searcheddata.isEmpty  ) {
                      return const Center(
                        child: Text('कोणताही ग्राम अधिकारी सापडला नाही',),
                      );
                    }
                    return ListView.builder(
                        itemCount: searcheddata.length,
                        itemBuilder: (contex ,index ){
                          final officermodel = searcheddata[index];
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
