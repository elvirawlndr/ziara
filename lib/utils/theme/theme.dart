import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ziara/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ziara/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ziara/utils/theme/custom_themes/chip_theme.dart';
import 'package:ziara/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ziara/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ziara/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ziara/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: TColors.darkBase,
    scaffoldBackgroundColor: TColors.lightBase,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,   
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutLinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: TColors.darkBase,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,   
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutLinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}