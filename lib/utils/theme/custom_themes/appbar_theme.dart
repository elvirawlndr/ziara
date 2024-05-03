import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';

class TAppBarTheme{
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.darkBase, size: 24),
    actionsIconTheme: IconThemeData(color: TColors.darkBase, size: 24),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.darkBase),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.darkBase, size: 24),
    actionsIconTheme: IconThemeData(color: TColors.darkBase, size: 24),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.lightBase),
  );
}