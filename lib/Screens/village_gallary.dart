import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/full_imageScreen.dart';
import 'package:pimpalgaonthote/core/Widgets/village_gallary_card.dart';

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
                      hintText: 'ग्राम अधिकारी शोधाा...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(

                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 10
                    ),
                    itemBuilder: (context , index){


                      return Villagegallarycard(
                        imageUrl:  'https://picsum.photos/300/30$index',

                        title: 'Village Dipavali celebration',

                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(

                              builder: (_)=>FullImageScreen(
                                  imageUrl: 'https://picsum.photos/300/30$index',
                                  Title: 'village Dipavali ascreen')

                          )
                          );
                        },

                      )

                      ;


                    }


                ),
              )
            ]
        )
    );
  }
}
