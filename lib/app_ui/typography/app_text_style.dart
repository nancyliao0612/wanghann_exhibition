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
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 38.4 / 24,
    ),
  );

  static TextStyle h2PC = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      height: 57.6 / 36,
    ),
  );

  static TextStyle h3 = GoogleFonts.workSans(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 26 / 20,
    ),
  );

  static TextStyle h3PC = GoogleFonts.workSans(
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 37.54 / 32,
    ),
  );

  static TextStyle title1 = GoogleFonts.workSans(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 25.6 / 16,
    ),
  );

  static TextStyle title1PC = GoogleFonts.workSans(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextStyle body1 = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 25.6 / 16,
    ),
  );

  static TextStyle body1PC = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 32 / 20,
    ),
  );

  static TextStyle caption = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 19.2 / 12,
    ),
  );

  static TextStyle captionPC = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 25.6 / 16,
    ),
  );
}
