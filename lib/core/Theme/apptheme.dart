import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/core/Theme/Colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: AppColour.textPrimary,
      ),

      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColour.textPrimary,
      ),

        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColour.text,


        ),

      titleMedium:TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
      ),
      titleSmall:TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColour.text
      ),


    ),



    appBarTheme:  AppBarTheme(

      backgroundColor: AppColour.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:  BorderSide(color: AppColour.primary, width: 2),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColour.primary,
        foregroundColor: AppColour.text,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
    ),




  );
  static BoxDecoration container = BoxDecoration(
    color: AppColour.containerbackground,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: AppColour.shadowcolour,
        blurRadius: 8,
      ),
    ],
  );
}