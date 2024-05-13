import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final theme = ThemeData(
  primaryColor: const Color.fromRGBO(17, 17, 17, 1),
  highlightColor: const Color.fromRGBO(255, 233, 34, 1),
  disabledColor: const Color.fromRGBO(17, 17, 17, 0.4),
  scaffoldBackgroundColor: const Color.fromRGBO(250, 250, 250, 1),
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: Color.fromRGBO(17, 17, 17, 1),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: const Color.fromRGBO(17, 17, 17, 1),
      fontWeight: FontWeight.w700,
      fontSize: 24.sp,
    ),
    titleMedium: TextStyle(
      color: const Color.fromRGBO(17, 17, 17, 1),
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
    ),
    titleSmall: TextStyle(
      color: const Color.fromRGBO(17, 17, 17, 1),
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
    ),
    bodyMedium: TextStyle(
      color: const Color.fromRGBO(17, 17, 17, 0.4),
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
    ),
    bodySmall: TextStyle(
      color: const Color.fromRGBO(17, 17, 17, 0.14),
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
    ),
  ),
);

const surfaceColor = Color.fromRGBO(17, 17, 17, 0.06);
final borderRadius12 = BorderRadius.circular(12.r);
final borderRadius16 = BorderRadius.circular(16.r);
