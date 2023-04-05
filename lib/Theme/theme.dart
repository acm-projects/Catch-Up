import 'package:flutter/material.dart';

class MainColor {
  static const MaterialColor DarkPink = const MaterialColor(
    0xffd79784, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffdba190), //10%
      100: const Color(0xffdfac9d), //20%
      200: const Color(0xffe3b6a9), //30%
      300: const Color(0xffe7c1b5), //40%
      400: const Color(0xffebcbc2), //50%
      500: const Color(0xffefd5ce), //60%
      600: const Color(0xfff3e0da), //70%
      700: const Color(0xfff7eae6), //80%
      800: const Color(0xfffbf5f3), //90%
      900: const Color(0xffffffff), //100%
    },
  );
}
