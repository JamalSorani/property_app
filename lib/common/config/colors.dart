// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color transparent = Colors.transparent;
  static const Color primary = Color(0xff000000);
  static const Color secondary = Color(0xffE50043);
  static const Color red = Color(0xffE80029);
  static const Color blue = Color(0xff0055F9);
  static const Color grey = Color(0xFFC0C0C6);
  static const Color green = Color(0xff00A707);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primary,
      primary.withOpacity(0.6),
    ],
  );
}
