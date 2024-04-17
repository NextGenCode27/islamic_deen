import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_deen/core/style/theme/colors.dart';

final ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  scaffoldBackgroundColor: backgroundColor,
  primaryColor: primaryColor,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: backgroundColor,
    onBackground: backgroundColor,
    primary: primaryColor,
    onPrimary: backgroundColor,
    secondary: orangeColor,
    onSecondary: backgroundColor,
    error: primaryColor,
    onError: backgroundColor,
    surface: backgroundColor,
    onSurface: primaryColor,
  ),
);
