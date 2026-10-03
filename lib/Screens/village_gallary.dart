import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/full_imageScreen.dart';
import 'package:pimpalgaonthote/Widgets/village_gallary_card.dart';
import 'package:pimpalgaonthote/model/gallerymodel.dart';

class VillageGallary extends StatefulWidget {
  const VillageGallary({super.key});

  @override
  State<VillageGallary> createState() => _VillageGallaryState();
}

class _VillageGallaryState extends State<VillageGallary> {

  String serchText = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: Column(
            children: [
              Text('गाव दर्शन'),

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


        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(

                  elevation: 4,

                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: 'ग्राम दर्शन शोधाा...',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value){

                      setState(() {
                        serchText = value;
                      });


                    },
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('gallery').snapshots(),
                    builder: (context, snapshot) {





                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('काहीतरी चूक झाली'),
                        );
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text('Gallery मध्ये फोटो उपलब्ध नाहीत'),
                        );
                      }




                      final doc = snapshot.data!.docs;

                      final modeldata = doc.map((a){
                        final data = a.data();

                        return ImageModel.fromMap(data);

                      }).toList();

                      final List<ImageModel> data = modeldata.where((a){

                        final name = a.name.toUpperCase();
                        final caption = a.caption.toUpperCase();

                        return
                          name.contains(serchText.toUpperCase())
                              || caption.contains(serchText.toUpperCase()
                          );
                      }).toList();

                      if(data.isEmpty){
                        return Center(
                          child:Text('No image Avaible'),
                        );
                      }






                      return GridView.builder(

                          itemCount: doc.length,

                          padding: EdgeInsetsGeometry.symmetric(horizontal: 15),

                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 10
                          ),

                          itemBuilder: (context , index){

                            final datas  = data[index];




                            return Villagegallarycard(
                              imageModel: datas,

                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(

                                    builder: (_)=>FullImageScreen(
                                        imageUrl: datas.imageUrl,//'https://picsum.photos/300/30$index',
                                        Title: datas.caption)

                                )
                                );
                              },

                            )

                            ;


                          }


                      );
                    }
                ),
              )
            ]
        )
    );
  }
}
