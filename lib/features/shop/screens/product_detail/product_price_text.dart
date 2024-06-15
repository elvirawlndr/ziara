import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({super.key, this.currencySign = '\$', required this.price, this.maxLines = 1, this.lineThrough = false, this.isLarge = true});

  final String currencySign;
  final int price;
  final int maxLines;
  final bool lineThrough;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16, vertical: 8
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text(
      currencySign + price.toStringAsFixed(2),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style:
      isLarge ? Theme.of(context).textTheme.titleMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null, color: TColors.black)
      : Theme.of(context).textTheme.bodySmall!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null, color: TColors.black),
      )
    );
  }
}