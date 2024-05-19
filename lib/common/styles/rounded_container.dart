import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child, this.width, this.height, this.radius = TSizes.cardRadiusLg, this.showBorder = false, this.borderColor = TColors.borderPrimary, this.backgroundColor = TColors.white, this.padding, this.margin
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }

  
}