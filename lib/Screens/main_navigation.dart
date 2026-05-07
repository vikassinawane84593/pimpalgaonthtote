import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/homeScreen.dart';
import 'package:pimpalgaonthote/Screens/profileScreen.dart';

class Mainnavigation extends StatefulWidget {
  const Mainnavigation({super.key});

  @override
  State<Mainnavigation> createState() => _MainnavigationState();
}

class _MainnavigationState extends State<Mainnavigation> {
  int Index=0;
  List<Map> bottomitem=[{'label':'Home','icon':Icons.home},{'label':'Profile','icon':Icons.person}];
  final List<Widget> _widgets=[HomeScreen(),ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index: Index,
        children: _widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Index,
          selectedItemColor: Colors.white,
          onTap: (value){
            setState(() {
              Index=value;
            });
          },
          items:bottomitem.map((e){
            return BottomNavigationBarItem(
                icon: Icon(e['icon']),
                label: e['label']);
          }).toList()

          ),
    );
  }
}