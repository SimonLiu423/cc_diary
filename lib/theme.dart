import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: const Color(0xFFF5EBE0),
    secondaryHeaderColor: const Color(0xFFD6CCC2),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFD6CCC2),
    ),
  );
}
