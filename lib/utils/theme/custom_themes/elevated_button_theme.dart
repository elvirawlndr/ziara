import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.lightBase,
      backgroundColor: TColors.darkBase,
      disabledForegroundColor: Colors.brown[200],
      disabledBackgroundColor: Colors.brown[200],
      side: const BorderSide(color: TColors.darkBase),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: TColors.lightBase, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.lightBase,
      backgroundColor: TColors.darkBase,
      disabledForegroundColor: Colors.brown[200],
      disabledBackgroundColor: Colors.brown[200],
      side: const BorderSide(color: TColors.darkBase),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: TColors.lightBase, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );
}
