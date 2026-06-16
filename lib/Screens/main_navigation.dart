import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/Cpmplaintscreen.dart';
import 'package:pimpalgaonthote/Screens/homeScreen.dart';
import 'package:pimpalgaonthote/Screens/profile_Screen.dart';
import 'package:pimpalgaonthote/Screens/village_gallary.dart';
import 'package:pimpalgaonthote/Screens/village_official.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';

class Mainnavigation extends StatefulWidget {
  const Mainnavigation({super.key});

  @override
  State<Mainnavigation> createState() => _MainnavigationState();
}

class _MainnavigationState extends State<Mainnavigation> {
  int _index=0;

  List<Map> bottomitem=[

    {'label':'Home','icon':Icons.home},

    {'label':'Complaint','icon':Icons.warning_amber},


    {'label':'Gallary','icon':Icons.image},

    {'label':'Profile','icon':Icons.person},



  ];

  final List<Widget> _widgets=[
    HomeScreen(),


    ComplaintScreen(),

    VillageGallary(),

    ProfileScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(

        index: _index,

        children: _widgets,
      ),

      bottomNavigationBar: NavigationBar(

        height: 70,

        backgroundColor: AppColour.bottomnavigationcolour,

        indicatorColor: Colors.transparent,

        onDestinationSelected: (index){
          setState(() {
            _index=index;
          });
        },

          selectedIndex: _index,
            destinations: bottomitem.map((element)=>
                NavigationDestination(


                    icon: Icon(element['icon']),

                    label: element['label'],

                    selectedIcon: Icon(
                      element['icon'],

                      size: 40,

                      color: AppColour.iconcolour,
                    ),

                ))
                .toList()

        /*NavigationDestination(

                icon: Icon(bottomitem[0]['icon']),
                label: bottomitem[0]['label']

            ),

            NavigationDestination(

                icon: Icon(bottomitem[1]['icon']),
                label: bottomitem[1]['label'])

          ]*/
          ),



    );
  }
}