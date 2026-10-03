import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:pimpalgaonthote/Screens/Auth/logiscreen.dart';
import 'package:pimpalgaonthote/Screens/Auth/resitrationScreen.dart';
import 'package:pimpalgaonthote/Screens/Lighttimetable.dart';
import 'package:pimpalgaonthote/Screens/contact_Screen.dart';
import 'package:pimpalgaonthote/Screens/homeScreen.dart';
import 'package:pimpalgaonthote/Screens/main_navigation.dart';
import 'package:pimpalgaonthote/Screens/notisescreen.dart';
import 'package:pimpalgaonthote/Screens/profile_Screen.dart';
import 'package:pimpalgaonthote/Screens/timetableascreen.dart';
import 'package:pimpalgaonthote/Screens/village_gallary.dart';
import 'package:pimpalgaonthote/Screens/village_official.dart';
import 'package:pimpalgaonthote/Widgets/Auth/AuthWrapper.dart';
import 'package:pimpalgaonthote/core/Theme/apptheme.dart';
import 'package:pimpalgaonthote/firebase_options.dart';
import 'package:pimpalgaonthote/main.dart';
import 'package:pimpalgaonthote/tester.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await Hive.initFlutter();

  await Hive.openBox('profile');

  Hive.openBox('profile');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
          width: 0.5,
          color: Colors.grey
      ),

    );
    return MaterialApp(
      debugShowCheckedModeBanner:false,
     // theme: AppTheme.lightTheme,
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(

                focusedBorder: border,
                enabledBorder: border

            ),

            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, // ← Text color

                backgroundColor: Colors.orangeAccent,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle:  TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            textTheme: TextTheme(
                headlineLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 43
                ),
              headlineMedium: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.lerp(Colors.greenAccent, Colors.black, 0.6)
              ),

              titleMedium: TextStyle(

                  fontWeight: FontWeight.bold,
                  color: Colors.black,

              )
            )
        ),

      home:AuthWrapper()//AuthWrapper()//ContactScreen()//HomeScreen()//()//Mainnavigation()///PhoneScreen(),AuthWrapper()
    );
  }
}
