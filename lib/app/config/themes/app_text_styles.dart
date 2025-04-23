import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  TextStyle get montserrat400;
  TextStyle get montserrat500;
  TextStyle get montserrat600;
  TextStyle get montserrat700;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get montserrat400 => GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get montserrat500 => GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get montserrat600 => GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get montserrat700 => GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
      );
}
