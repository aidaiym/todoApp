import 'package:flutter/material.dart';
import 'package:todoapp/constants/app_colors.dart';

@immutable
final class AppTextStyles {
  static TextStyle white16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: 'Roboto',
  );
  static TextStyle white25Italic = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w100,
    color: Colors.white,
    fontFamily: 'Roboto',
    fontStyle: FontStyle.italic,
  );
  static TextStyle dark18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.purple,
    fontFamily: 'Roboto',
  );
   static TextStyle dark16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.purple,
    fontFamily: 'Roboto',
  );
   static TextStyle black16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'Roboto',
  );
  static TextStyle dark12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.purple,
    fontFamily: 'Roboto',
  );
  static TextStyle yellow12 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.yellow,
    fontFamily: 'Roboto',
  );
}
