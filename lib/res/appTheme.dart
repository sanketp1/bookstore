import 'package:bookstore/res/appColor.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColor.primaryColor
      ),
      appBarTheme: AppBarTheme(backgroundColor: AppColor.primaryColor),
    

      );
}
