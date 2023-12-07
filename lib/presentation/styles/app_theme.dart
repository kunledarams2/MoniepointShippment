
import 'package:flutter/material.dart';
import '__export__.dart';

class AppTheme {
  static final defaultAppTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    textTheme: TextTheme(
      labelLarge: CustomStyle.textStyleInter,
      labelMedium: CustomStyle.textStyleInter,
      labelSmall: CustomStyle.textStyleInter,
      titleLarge: CustomStyle.textStyleInter,
      titleMedium: CustomStyle.textStyleInter,
      titleSmall: CustomStyle.textStyleInter,
      bodyLarge: CustomStyle.textStyleInter,
      bodyMedium: CustomStyle.textStyleInter,
      bodySmall: CustomStyle.textStyleInter,
    ),
    canvasColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    fontFamily: 'Inter',
  );
}
