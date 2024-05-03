import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TColors.lightBase;
      } else {
        return TColors.darkBase;
      }
    }),

    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TColors.darkBase;
      } else {
        return Colors.transparent;
      }
    }),
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TColors.lightBase;
      } else {
        return TColors.darkBase;
      }
    }),

    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TColors.darkBase;
      } else {
        return Colors.transparent;
      }
    }),
  );
}