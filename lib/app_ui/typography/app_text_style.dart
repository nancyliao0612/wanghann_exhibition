import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class UITextStyle {
  static TextStyle h1 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w600,
      height: 64 / 64,
    ),
  );

  static TextStyle h1PC = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 100,
      fontWeight: FontWeight.w600,
      height: 100 / 100,
    ),
  );

  static TextStyle h2 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      height: 57.6 / 36,
    ),
  );

  static TextStyle h2Chinese = GoogleFonts.notoSansTc(
    textStyle: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      height: 57.6 / 36,
    ),
  );

  static TextStyle h3 = GoogleFonts.workSans(
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 41.6 / 32,
    ),
  );

  static TextStyle h3_video = GoogleFonts.robotoCondensed(
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      height: 41.6 / 32,
    ),
  );

  static TextStyle title1 = GoogleFonts.workSans(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 32 / 20,
    ),
  );

  static TextStyle title1Chinese = GoogleFonts.notoSansTc(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 32 / 20,
    ),
  );

  static TextStyle body1 = GoogleFonts.notoSansTc(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 32 / 20,
    ),
  );

  static TextStyle caption = GoogleFonts.notoSansTc(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 25.6 / 16,
    ),
  );
}
