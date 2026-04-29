import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/homeScreen.dart';
import 'package:pimpalgaonthote/Screens/profileScreen.dart';

class Mainnavigation extends StatefulWidget {
  const Mainnavigation({super.key});

  @override
  State<Mainnavigation> createState() => _MainnavigationState();
}

class _MainnavigationState extends State<Mainnavigation> {
  int index=0;
  final List<Widget> _widgets=[HomeScreen(),ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value){
            setState(() {
              index=value;
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