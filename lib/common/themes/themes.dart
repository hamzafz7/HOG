import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';

var lighttheme = ThemeData(

    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    colorScheme: const ColorScheme.light().copyWith(
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 48.sp,
          fontFamily: 'Hacen Tunisia',
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: kDarkBlueColor),
      titleMedium: TextStyle(
          fontSize: 30.sp,
          fontFamily: 'Hacen Tunisia',
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: kDarkBlueColor),
      bodySmall: TextStyle(
          fontSize: 12.sp,
          fontFamily: 'Hacen Tunisia',
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
          color: kDarkBlueColor),
      bodyLarge: TextStyle(
          fontSize: 24.sp,
          letterSpacing: 0,
          fontFamily: 'Hacen Tunisia',
          fontWeight: FontWeight.w400,
          color: kDarkBlueColor),
      bodyMedium: TextStyle(
          fontSize: 16.sp,
          fontFamily: 'Hacen Tunisia',
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: kDarkBlueColor),
      labelLarge: TextStyle(
        color: kDarkBlueColor,
        fontSize: 28.sp,
        fontFamily: 'Hacen Tunisia',
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 0,
      ),
      labelMedium: TextStyle(
        color: kDarkBlueColor,
        fontSize: 20.sp,
        fontFamily: 'Hacen Tunisia',
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        // height: 0.07,
      ),
    ));

var darkTheme = ThemeData(

    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    colorScheme: const ColorScheme.light().copyWith(
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 7, 37, 61),
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          letterSpacing: 0,
          fontSize: 48.sp,
          fontFamily: 'Hacen Tunisia',
          fontWeight: FontWeight.w400,
          color: Colors.white),
      titleMedium: TextStyle(
          letterSpacing: 0,
          color: Colors.white,
          fontSize: 30.sp,
          fontFamily: 'Hacen Tunisia',
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          color: Colors.white,
          letterSpacing: 0,
          fontSize: 12.sp,
          fontFamily: 'Hacen Tunisia',
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          color: Colors.white,
          letterSpacing: 0,
          fontSize: 24.sp,
          fontFamily: 'Hacen Tunisia',
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          letterSpacing: 0,
          fontFamily: 'Hacen Tunisia',
          fontWeight: FontWeight.w500),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 28.sp,
        fontFamily: 'Hacen Tunisia',
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        height: 0,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontFamily: 'Hacen Tunisia',
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
    ));
