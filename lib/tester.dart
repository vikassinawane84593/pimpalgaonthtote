import 'package:flutter/material.dart';


class Tester extends StatelessWidget {
  const Tester({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DropdownExample(),
    );
  }
}

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {

  String selectedSection = "Home";

  final List<String> sections = [
    "Home",
    "Gallery",
    "Notice",
    "Electricity",
    "Contact",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [

            DrawerHeader(
              child: Column(
                children: [
                  Icon(Icons.park,size: 50),
                  Text(
                    "पिंपळगाव थोटे",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text("ग्रामपंचायत"),

                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("मुख्य पृष्ठ"),
              selected: false,
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.chat_bubble_outline),
              title: Text("तक्रारी"),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.image_outlined),
              title: Text("गॅलरी"),
              trailing: Icon(Icons.chevron_right),
            ),

            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("वेळापत्रक"),
              trailing: Icon(Icons.chevron_right),
            ),

            ListTile(
              leading: Icon(Icons.people_outline),
              title: Text("पदाधिकारी"),
              trailing: Icon(Icons.chevron_right),
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.notifications_none),
              title: Text("सूचना"),
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("सेटिंग्स"),
            ),

            Spacer(),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("लॉगआउट"),
            ),
          ],
        ),
      ),
    );
  }
}