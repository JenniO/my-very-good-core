import 'package:flutter/material.dart';

import 'package:{{project_name.snakeCase()}}/assets/assets.dart';
import 'package:{{project_name.snakeCase()}}/presentation/ui/ui.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      height: 1.375,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      height: 1.375,
      fontSize: 24,
      fontWeight: FontWeight.w800,
    ),
    displaySmall: TextStyle(
      height: 1.375,
      fontSize: 20,
      fontWeight: FontWeight.w800,
    ),
    bodyLarge: TextStyle(
      height: 1.3,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      height: 1.375,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      height: 1.5,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      height: 1.6,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      height: 1.5,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: ColorName.yellow,
    onPrimary: ColorName.black,
    secondary: ColorName.yellow,
    onSecondary: ColorName.black,
    surface: ColorName.black.withOpacity(0.2),
    onSurface: ColorName.white,
    background: ColorName.black,
    onBackground: ColorName.white,
    error: Color(0xFFF63B3B),
    onError: ColorName.white,
    brightness: Brightness.dark,
  ),
  fontFamily: FontFamily.poppins,
  splashFactory: InkHighlightFactory(),
  filledButtonTheme: FilledButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorName.yellow,
      foregroundColor: Colors.black,
      elevation: 0,
      minimumSize: Size.fromHeight(56),
      maximumSize: Size.fromHeight(56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(56),
      ),
      textStyle: TextStyle(
        fontSize: 15,
        fontFamily: FontFamily.poppins,
        fontWeight: FontWeight.w800,
        height: 1.6,
      ),
      padding: EdgeInsets.symmetric(horizontal: 32),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: ColorName.yellow,
      elevation: 0,
      minimumSize: Size.fromHeight(56),
      maximumSize: Size.fromHeight(56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(56),
      ),
      side: BorderSide(
        color: ColorName.yellow,
        width: 1,
      ),
      textStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w800,
        fontFamily: FontFamily.poppins,
        height: 1.6,
      ),
      padding: EdgeInsets.symmetric(horizontal: 32),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: ColorName.black,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.poppins,
        height: 1.375,
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      padding: EdgeInsets.zero,
      fixedSize: Size(56, 56),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    filled: true,
    fillColor: ColorName.white.withOpacity(0.2),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    labelStyle: TextStyle(
      color: Colors.white.withOpacity(0.7),
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.poppins,
    ),
  ),
  drawerTheme: DrawerThemeData(
    elevation: 0,
    backgroundColor: ColorName.black,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: ColorName.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      ),
    ),
  ),
  expansionTileTheme: ExpansionTileThemeData(
    iconColor: ColorName.white,
    collapsedIconColor: ColorName.white,
    tilePadding: EdgeInsets.only(right: 18),
  ),
);
