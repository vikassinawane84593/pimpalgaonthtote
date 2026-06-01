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
        color: AppColour.textPrimary
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColour.text
    ),


    ),




      appBarTheme:  AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        titleTextStyle: TextStyle(
          color:AppColour.textScondary,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),

        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),


    inputDecorationTheme: InputDecorationTheme(

      hintStyle: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold
      ),

     prefixIconColor: Colors.grey,

      filled: true,
      fillColor: const Color(0xfff3f3f3),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
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
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color:AppColour.shadowcolour,
        blurRadius: 2,
          offset: Offset(0,0)
      ),
    ],
  );
}