import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomStadiumButton extends StatelessWidget {
  final Color? backgroundColor;
  final String text;
  final TextStyle? style;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;
  const CustomStadiumButton(
      {super.key,
      this.backgroundColor,
      required this.text,
      this.style,
      this.padding,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppTheme.colors.purple,
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 22.0,
              horizontal: 36,
            ),
        child: Text(
          text,
          style: style ??
              AppTheme.textStyles.montserrat600.copyWith(
                fontSize: 17,
                color: AppTheme.colors.white2,
              ),
        ),
      ),
    );
  }
}
