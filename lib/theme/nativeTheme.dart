//flutter
// ignore_for_file: file_names, deprecated_member_use

import 'package:astromeet/constants/colorConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 146, 77, 1.0),
  100: const Color.fromRGBO(190, 95, 30, 1.0),
  200: const Color.fromRGBO(210, 105, 35, 1.0),
  300: const Color.fromRGBO(204, 100, 31, 1.0),
  400: const Color.fromRGBO(210, 103, 31, 1.0),
  500: const Color.fromRGBO(196, 95, 28, 1.0),
  600: const Color.fromRGBO(225, 108, 30, 1.0),
  700: const Color.fromRGBO(199, 94, 23, 1.0),
  800: const Color.fromRGBO(255, 103, 1, 1.0),
  900: const Color.fromRGBO(255, 101, 0, 1.0),
};

class Themes {
  static final light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: COLORS().primaryColor,
      foregroundColor: COLORS().blackColor,
      elevation: 0.5,
    ),

    primaryColor: const Color(0xffffc107),

    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(color: Colors.black, fontSize: 12),
      headlineMedium: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(color: Colors.black), //
      titleLarge: TextStyle(color: Colors.black), //
      bodySmall: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black, fontSize: 14),
      titleSmall: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    primaryTextTheme: TextTheme(
      displayLarge: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 19), //APPbAR
      displayMedium: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16), //SignUp ma Title
      displaySmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 11.sp), // Bold Name
      headlineMedium: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 19), //AppBar bold
      headlineSmall: const TextStyle(color: Colors.black),
      titleLarge: const TextStyle(color: Colors.black),
      bodySmall:
          TextStyle(color: COLORS().bodyTextColor, fontSize: 10), //bottom Bar
      titleMedium: TextStyle(color: COLORS().bodyTextColor), //Body Text ma
      titleSmall: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400), //small subtitle
      bodyLarge: const TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
      bodyMedium: const TextStyle(color: Colors.black),
    ),
//Card theme
    cardTheme: const CardTheme(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      elevation: 0.5,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
    ),
//Textfield Decoration
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      filled: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      /* enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.grey),
      ), */
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: COLORS().primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
      helperStyle: TextStyle(color: COLORS().primaryColor),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xffffc107)),
        foregroundColor: MaterialStateProperty.all(const Color(0xFFF5F5F5)),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(0xffffc107, color),
    ).copyWith(background: Colors.white),
  );
  static final dark = ThemeData.dark().copyWith(
      primaryColor: const Color(0xffffc107),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.black),
        displayMedium: TextStyle(color: Colors.black),
        displaySmall: TextStyle(color: Colors.black, fontSize: 12),
        headlineMedium: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.white), //
        titleLarge: TextStyle(color: Colors.black), //
        bodySmall: TextStyle(color: Colors.black),
        titleMedium: TextStyle(color: Colors.black),
        titleSmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
      primaryTextTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w300, fontSize: 19), //
        displayMedium: TextStyle(color: Colors.black),
        displaySmall: TextStyle(color: Colors.black, fontSize: 12),
        headlineMedium: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
        titleMedium: TextStyle(color: Colors.black), //
        titleSmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
      ),
      cardTheme: CardTheme(
        margin: const EdgeInsets.all(10),
        color: Colors.blue[200],
        elevation: 0.5,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.red,
      ));
}
