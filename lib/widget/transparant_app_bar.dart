import 'package:cv_finder/theme.dart';
import 'package:flutter/material.dart';

AppBar TransparantAppBar(String title) {
  return AppBar(
    title: Center(child: Text(title, style: ubuntu24Bold)),
    elevation: 0.0,
    backgroundColor: const Color(0x00000000),
  );
}
