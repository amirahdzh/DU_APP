import 'package:flutter/material.dart';
import 'package:nq_app/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:nq_app/src/utils/theme/widget_themes/outlined_button_theme.dart';
// import 'package:nq_app/src/utils/theme/widget_themes/swatch_theme.dart';
import 'package:nq_app/src/utils/theme/widget_themes/text_theme.dart';

import '../../constants/colors.dart';

class DuAppTheme{

  // Make the constructor private
  DuAppTheme._();

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    textTheme: DuTextTheme.lightTextTheme,
    brightness: Brightness.light,
    outlinedButtonTheme: DuOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: DuElevatedButtonTheme.lightElevatedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    /* DEVELOPED SOON */
  );
}