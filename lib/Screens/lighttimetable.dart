import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Widgets/timetelingwidget.dart';
import 'package:pimpalgaonthote/model/lighttimetable.dart';

class Lighttimetable extends StatefulWidget {
  const Lighttimetable({super.key});

  @override
  State<Lighttimetable> createState() => _LighttimetableState();
}

class _LighttimetableState extends State<Lighttimetable> {

  late String dayStartTime;
  late String dayEndTime;
  late String nightStartTime;
  late String nightEndTime;
  late String startDate;
  late String endDate;

  bool isnet = true;

  bool isloading = true;



  Future getDAta() async {

    final connection = await Connectivity().checkConnectivity();

    if (connection.contains(ConnectivityResult.none)) {

      setState(() {
        isnet=false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Internet available नाही'),
        ),
      );
      return;
    }



    try {
      setState(() {
        isnet=true;
        isloading = true;

      });
      final doc = await FirebaseFirestore.instance
          .collection('timetable')
          .doc('Zpm1Vn3qiZSAtsXt2LeB')
          .get();

      final Map<String,dynamic>? data = doc.data();

      if (data != null) {

        LightTimetable lighttimetable = LightTimetable.fromMap(data);

        setState(() {

          dayStartTime = lighttimetable.dayStartTime;
          dayEndTime = lighttimetable.dayEndTime;
          nightStartTime = lighttimetable.nightStartTime;
          nightEndTime = lighttimetable.nightEndTime;
          startDate = lighttimetable.startDate;
          endDate = lighttimetable.endDate;

          isloading=false;

        });

      }
    }

    catch (e){
      ScaffoldMessenger.of(context)
          .showSnackBar(
          SnackBar(
              content: Text('error$e')
          ));
    }
  }

  @override
  void initState() {
    getDAta();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Column(
            children: [
              Text('वीज पुरवठा वेळापत्रक'),

              Text(
                'पिंपळगाव थोटे',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87
                ),
              ),


            ],
          ),
          actions: [
           IconButton(

             onPressed: (){
               getDAta();
             },
             icon: Icon(

               Icons.refresh,
               color: Colors.black,
             ),

           )
          ],
          centerTitle: true,
        ),

        body: isnet
            ? isloading
            ? Center(
          child: CircularProgressIndicator(),)
            : Column(
            children: [
              SizedBox(
                height: 100,
                width:double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.green[100],
                            child: Icon(
                                Icons.calendar_month
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsetsGeometry.only(top: 15,left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                'कालावधी',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green
                                ),


                              ),

                              Text(
                                '$startDate - $endDate',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        color: Colors.green,
                      ),
                    ),
                  ),

                  Text(
                    'वीज पुरवठा वेळापत्रक',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                    ),

                  ),

                  Expanded(
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(
                        color: Colors.green,

                      ),
                    ),
                  )
                ],
              ),


              Timetelingwidget(

                  day: 'दिवसा',
                  starttime: dayStartTime,
                  endtime: dayEndTime,
                  colors: Colors.orange,
                  icons:Icons.sunny

              ),

              Timetelingwidget(
                day: 'रात्री',
                starttime: nightStartTime,
                endtime: nightEndTime,
                colors: Colors.blue,
                icons: Icons.nightlight_round,
              )



            ]
        )
            :Center(
            child:Text('No Internet')
        )
    );
  }
}
