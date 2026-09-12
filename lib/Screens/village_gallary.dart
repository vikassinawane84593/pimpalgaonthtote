import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/full_imageScreen.dart';
import 'package:pimpalgaonthote/Widgets/village_gallary_card.dart';
import 'package:pimpalgaonthote/model/gallerymodel.dart';

class VillageGallary extends StatelessWidget {
  const VillageGallary({super.key});

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






                      return GridView.builder(

                          itemCount: doc.length,

                          padding: EdgeInsetsGeometry.symmetric(horizontal: 15),

                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 10
                          ),

                          itemBuilder: (context , index){

                            final data  = doc[index].data();
                            final model = ImageModel.fromMap(data);


                            return Villagegallarycard(
                              imageModel: model,

                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(

                                    builder: (_)=>FullImageScreen(
                                        imageUrl: model.imageUrl,//'https://picsum.photos/300/30$index',
                                        Title: model.caption)

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
