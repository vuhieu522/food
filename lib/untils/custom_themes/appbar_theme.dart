import 'package:flutter/material.dart';

class FAppBarTheme {
  FAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    centerTitle: false,
    elevation: 2,
    backgroundColor: Colors.blue,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
  );
  static const darkAppBarTheme = AppBarTheme(
    centerTitle: false,
    elevation: 2,
    iconTheme: IconThemeData(color: Colors.white, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
  );
}