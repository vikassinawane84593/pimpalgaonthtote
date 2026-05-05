import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Screens/homeScreen.dart';
import 'package:pimpalgaonthote/Screens/profileScreen.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';
import 'package:pimpalgaonthote/tester.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: AppTheme.lightTheme,
      home: Tester()//ProfileScreen()//PhoneScreen(),
    );
  }
}
