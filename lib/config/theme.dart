
import 'package:flutter/material.dart';

import 'package:ground_ups/config/colors.dart';
import 'package:ground_ups/config/const.dart';

class AppTheme {
  ThemeData get lightTheme {
    final baseTheme = ThemeData.light();

    final colorScheme = baseTheme.colorScheme.copyWith(
      primary: primary,
      onPrimary: Colors.white,
      secondary: info,
      onSecondary: Colors.white,
      error: danger,
    );

    return baseTheme.copyWith(
      useMaterial3: true,
      colorScheme: colorScheme,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: primary, fontSize: 14),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primary),
        ),
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.white,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(primary),
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: disableBg,
          disabledForegroundColor: disableText,
          foregroundColor: primary,
          backgroundColor: primary.shade50,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          disabledForegroundColor: disableText,
          foregroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(color: primary),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: 'regular',
          fontSize: 27,
          color: primary,
          fontWeight: FontWeight.bold,
          height: 1.24,
        ),
        headline2: TextStyle(
          fontFamily: 'regular',
          fontSize: 24,
          color: primary,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          fontFamily: 'regular',
          fontSize: 21,
          color: primary,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        headline4: TextStyle(
          fontFamily: 'regular',
          fontSize: 17,
          color: primary,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        headline5: TextStyle(
          fontFamily: 'regular',
          fontSize: 16,
          color: primary,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        headline6: TextStyle(
          fontFamily: 'regular',
          fontSize: 14,
          color: primary,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        bodyText1: TextStyle(
          fontFamily: 'regular',
          fontSize: 13,
          color: primary,
          fontWeight: FontWeight.w400,
          height: 1.2,
        ),
        bodyText2: TextStyle(
          fontFamily: 'regular',
          fontSize: 10,
          color: primary,
          fontWeight: FontWeight.w400,
          height: 1.2,
        ),
        button: const TextStyle(
          fontFamily: 'regular',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.2,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        shape: const CircleBorder(),
      ),
      dialogTheme:  const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(md)),
        ),
      ),
      unselectedWidgetColor: disableText,
      primaryColor: primary,
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(primary),
      ),
    );
  }
}
