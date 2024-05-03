import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutLinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: TColors.darkBase),
      textStyle: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static final darkOutLinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.lightBase,
      side: const BorderSide(color: TColors.darkBase),
      textStyle: const TextStyle(fontSize: 16, color: TColors.lightBase, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

}