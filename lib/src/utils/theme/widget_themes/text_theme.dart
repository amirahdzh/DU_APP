import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DuTextTheme {

  DuTextTheme._(); // to avoid creating instance

  static TextTheme lightTextTheme = TextTheme(
      headlineMedium: GoogleFonts.montserrat(
        color: Colors.black87,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: Colors.black54,
        // fontSize: 12,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: Colors.black54,
        fontSize: 24,
      ),
  );

  static TextTheme darkTextTheme = TextTheme(
    /* DEVELOPED SOON */
  );
}