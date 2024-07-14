import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppThemeManager{
  static const primaryColor = Color(0xff004182);
  static ThemeData lightTheme =ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          color: Color(0xff06004F),
          fontSize: 20,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
          color: Color(0xff06004F),
          fontSize: 18,
        ),
        bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w300,
          color: Color(0xff06004F),
          fontSize: 16,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: Colors.white),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.transparent,
          unselectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(color: Colors.white))
  );
}