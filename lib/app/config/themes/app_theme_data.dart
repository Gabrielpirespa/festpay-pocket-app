import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData primaryTheme() => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: AppTheme.colors.backgroundColor,
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputDecorationTheme,
        splashColor: AppTheme.colors.transparent,
      );

  static AppBarTheme get _appBarTheme => AppBarTheme(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: AppTheme.colors.backgroundColor,
        titleTextStyle: AppTheme.textStyles.montserrat600.copyWith(
          fontSize: 18,
          color: AppTheme.colors.black,
        ),
      );

  static InputDecorationTheme get _inputDecorationTheme {
    final borderRadius = BorderRadius.circular(30.0);

    return InputDecorationTheme(
      fillColor: AppTheme.colors.white,
      filled: true,
      focusColor: AppTheme.colors.primaryColor,
      hintStyle: AppTheme.textStyles.montserrat600
          .copyWith(fontSize: 17, color: AppTheme.colors.gray2),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.colors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppTheme.colors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: AppTheme.colors.primaryColor,
        ),
      ),
    );
  }
}
