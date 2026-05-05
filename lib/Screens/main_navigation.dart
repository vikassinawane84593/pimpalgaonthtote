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
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'profile'

            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile'
            ),

          ]),
    );
  }
}