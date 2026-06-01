import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:pimpalgaonthote/Screens/News.dart';
import 'package:pimpalgaonthote/Screens/main_navigation.dart';
import 'package:pimpalgaonthote/Screens/profile_Screen.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await Hive.initFlutter();

  await Hive.openBox('profile');

  Hive.openBox('profile');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: AppTheme.lightTheme,
      home:NewsScreen()//Mainnavigation()///PhoneScreen(),AuthWrapper()
    );
  }
}
