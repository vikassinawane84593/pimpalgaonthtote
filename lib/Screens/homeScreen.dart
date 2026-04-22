import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/profileScreen.dart';


class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  int _currentindex=0;
  final List<Widget> _pages=[HomeScreen(),profileScreen()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentindex],
      
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
          
        ],
        onTap: (index){
          setState(() {
            _currentindex=index;
          });
        },
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Cneter'),),
    );
  }
}
