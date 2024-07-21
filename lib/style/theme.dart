import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'Quicksand',
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 25,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    ));
ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontSize: 18,
  )),
  scaffoldBackgroundColor: Colors.black54,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepOrange,
      backgroundColor: Colors.black54,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black54,
    elevation: 0.0,
    actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 25,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black54,
        statusBarIconBrightness: Brightness.light),
  ),
);
