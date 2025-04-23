import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primaryColor;
  Color get backgroundColor;
  Color get black;
  Color get gray;
  Color get gray2;
  Color get gray3;
  Color get lightGray;
  Color get lightGray2;
  Color get lightGray3;
  Color get pink;
  Color get purple;
  Color get red;
  Color get transparent;
  Color get white;
  Color get white2;
}

class AppColorsDefault implements AppColors {
  @override
  Color get primaryColor => const Color(0xFFA438A8);
  @override
  Color get backgroundColor => const Color(0xFFF2F2F2);
  @override
  Color get black => const Color(0xFF000000);
  @override
  get gray => const Color(0xFF9A9A9D);
  @override
  get gray2 => const Color(0xFF808080);
  @override
  get gray3 => const Color(0xFFADADAF);
  @override
  Color get lightGray => const Color(0xFFE8E8E8);
  @override
  Color get lightGray2 => const Color(0xFFEFEFEF);
  @override
  Color get lightGray3 => const Color(0xFFE9ECF1);
  @override
  get pink => const Color(0xFFEC407A);
  @override
  get purple => const Color(0xFF483698);
  @override
  get red => const Color(0xFFD11621);
  @override
  get transparent => Colors.transparent;
  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get white2 => const Color(0xFFF6F6F9);
}
