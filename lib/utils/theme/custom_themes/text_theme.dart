import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.darkBase),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.darkBase),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.darkBase),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.darkBase),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color:TColors. darkBase),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.darkBase),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.darkBase),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.darkBase),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.darkBase.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.darkBase),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.darkBase.withOpacity(0.5)),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.lightBase),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.lightBase),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.lightBase),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.bold, color: TColors.lightBase),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.lightBase),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.lightBase),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.bold, color: TColors.lightBase),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w600, color: TColors.lightBase),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w600, color: TColors.lightBase.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.bold, color: TColors.lightBase),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w600, color: TColors.lightBase.withOpacity(0.5)),
  );
}