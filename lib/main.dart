import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/Auth/otpGenerated.dart';
import 'package:pimpalgaonthote/Auth/verifiotp.dart';
import 'package:pimpalgaonthote/Screens/SplashScreen.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: AppTheme.lightTheme,
      home: SplashScreen()//PhoneScreen(),
    );
  }
}
