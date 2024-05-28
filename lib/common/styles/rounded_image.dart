import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({super.key, this.width, this.height, required this.image, this.applyImageRadius = true, this.border, this.backgroundColor = TColors.lightBase, this.fit = BoxFit.contain, this.padding, this.onPressed, this.borderRadius = TSizes.md
  });

  final double? width, height;
  final String image;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius): BorderRadius.zero,
          child: Image(fit: fit, image: AssetImage(image)),
      ),
      )
    );
  }
}