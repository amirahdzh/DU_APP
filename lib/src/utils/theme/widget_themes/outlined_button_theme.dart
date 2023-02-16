import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class DuOutlinedButtonTheme {
  DuOutlinedButtonTheme._(); // to avoid creating instance

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: duPrimaryColor,
        side: BorderSide(color: duPrimaryColor),
        padding: EdgeInsets.symmetric(vertical: 15)),
  );
}
