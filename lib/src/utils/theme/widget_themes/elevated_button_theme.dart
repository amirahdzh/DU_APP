import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class DuElevatedButtonTheme {
  DuElevatedButtonTheme._(); // to avoid creating instance

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: duAccentColor,
        backgroundColor: duPrimaryColor,
        elevation: 0,
        side: BorderSide(color: duPrimaryColor),
        padding: EdgeInsets.symmetric(vertical: 15)),
  );

  // DARK TBD
}
