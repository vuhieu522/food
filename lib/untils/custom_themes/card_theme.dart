import 'package:flutter/material.dart';

class FCardTheme {
  FCardTheme._();

  static const lightCardTheme = CardTheme(
    surfaceTintColor: Colors.black,
    elevation: 2,
    color: Colors.white,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
  static const darkCardTheme = CardTheme(
    color: Colors.black,
    shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    shadowColor: Colors.white,
  );
}
