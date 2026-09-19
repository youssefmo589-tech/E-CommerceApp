import 'package:flutter/material.dart';

import '../AppColors/AppColors.dart';

class AppThemeManager {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            fontFamily: "Raleway"
        ),

        titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Raleway"
        ),

        titleSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: "Raleway"
        )


    ),
  );


  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            fontFamily: "Raleway"
        ),

        titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Raleway"
        ),

        titleSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: "Raleway"
        )


    ),
  );
}
