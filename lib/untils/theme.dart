import 'package:flutter/material.dart';
import 'package:foody/untils/custom_themes/appbar_theme.dart';
import 'package:foody/untils/custom_themes/card_theme.dart';
import 'package:foody/untils/custom_themes/decoration_theme.dart';
import 'package:foody/untils/custom_themes/elevated_button_theme.dart';
import 'package:foody/untils/custom_themes/text_theme.dart';
import 'custom_themes/floating_button_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: FTextTheme.lightTextTheme,
    elevatedButtonTheme: FElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: FAppBarTheme.lightAppBarTheme,
    cardTheme: FCardTheme.lightCardTheme,
    inputDecorationTheme: FDecorationTheme.lightInputDecorationTheme,
    floatingActionButtonTheme: FFloatingAButtonTheme.lightFloatingAButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: FTextTheme.darkTextTheme,
    elevatedButtonTheme: FElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: FAppBarTheme.darkAppBarTheme,
    cardTheme: FCardTheme.darkCardTheme,
    inputDecorationTheme: FDecorationTheme.darkInputDecorationTheme,
    floatingActionButtonTheme: FFloatingAButtonTheme.darkFloatingAButtonTheme,
  );
}