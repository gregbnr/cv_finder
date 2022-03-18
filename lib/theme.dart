import 'package:flutter/material.dart';

Color grey = const Color(0xff333333);
Color lightGrey = Color(0xff54595C);

TextStyle ubuntu24Bold = TextStyle(
    color: grey,
    fontSize: 24,
    letterSpacing: 2,
    fontFamily: "Ubuntu",
    fontWeight: FontWeight.bold);

TextStyle ubuntu20Medium = const TextStyle(
    fontSize: 20, fontFamily: "Ubuntu", fontWeight: FontWeight.w500);

TextStyle ubuntu15Medium = TextStyle(
    fontSize: 15,
    fontFamily: "Ubuntu",
    fontWeight: FontWeight.w500,
    color: grey);

TextStyle ubuntu15Italic = const TextStyle(
    fontSize: 15, fontFamily: "Ubuntu", fontStyle: FontStyle.italic);

TextStyle ubuntu12 = TextStyle(fontSize: 12, fontFamily: "Ubuntu", color: grey);

TextStyle ubuntu12Light = TextStyle(
    fontSize: 12,
    fontFamily: "Ubuntu",
    fontWeight: FontWeight.w300,
    color: lightGrey);
