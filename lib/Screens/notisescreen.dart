import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Widgets/notiseCard.dart';
import 'package:pimpalgaonthote/model/notiseModel.dart';


class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'सूचना',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('warnings').orderBy('createdAt', descending: true).snapshots(),
        builder: (context, napshot) {

          if (napshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(napshot.hasError) {
            return Center(
              child: Text('Error: ${napshot.error}'),
            );
          }
          if(!napshot.hasData || napshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('कोणत्याही सूचना उपलब्ध नाहीत'),
            );
          }
          final docs = napshot.data!.docs;

          return ListView.builder(
              itemBuilder: (context,index){

                final data = docs[index].data();
                final modeldata = NotiseModel.fromMap(data);

                return NoticeCard(
                  title: modeldata.warning,
                  description: modeldata.type,
                  date: modeldata.date,
                  icon: Icons.campaign,
                );


              });
          /*return ListView.builder(
              padding: const EdgeInsets.all(16),
              children: [

                NoticeCard(
                  title: 'ग्रामसभा सूचना',
                  description:
                  'सर्व ग्रामस्थांना कळविण्यात येते की ग्रामसभा रविवार रोजी सकाळी 10 वाजता ग्रामपंचायत कार्यालयात आयोजित करण्यात आली आहे.',
                  date: '21 सप्टेंबर 2026',
                  icon: Icons.campaign,
                ),

                NoticeCard(
                  title: 'वीज पुरवठा सूचना',
                  description:
                  'गावातील वीज पुरवठा देखभाल कामामुळे काही वेळ बंद राहणार आहे.',
                  date: '20 सप्टेंबर 2026',
                  icon: Icons.bolt,
                ),

                NoticeCard(
                  title: 'पाणीपुरवठा सूचना',
                  description:
                  'उद्या सकाळी 7 वाजता पाणीपुरवठा करण्यात येणार आहे. सर्व नागरिकांनी याची नोंद घ्यावी.',
                  date: '19 सप्टेंबर 2026',
                  icon: Icons.water_drop,
                ),

              ],
            ),
          );*/
        }
      ),
    );
  }
}