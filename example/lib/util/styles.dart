import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const Color productRowDivider = Color(0xFFD9D9D9);
  static const Color darkBlue = Color.fromRGBO(23, 36, 42, 1.0);
  static const Color black = Color.fromRGBO(37, 41, 42, 1.0);
  static const Color lightGrey = Color.fromRGBO(140, 140, 140, 1.0);
  static const Color searchBackground = Color(0xffe0e0e0);
  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);

  static const TextStyle productRowItemName = TextStyle(
    color: Colors.white, //Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle productRowItemPrice = TextStyle(
    color: Colors.white, //Color(0xFF8E8E93),
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle searchText = TextStyle(
    color: Colors.white, //Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
}
