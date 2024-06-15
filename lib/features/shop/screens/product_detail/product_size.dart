import 'package:flutter/material.dart';
import 'package:ziara/features/shop/screens/product_detail/product_choice_chip.dart';
import 'package:ziara/utils/const/colors.dart';

class TProductSize extends StatelessWidget {
  const TProductSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.darkergrey),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        Wrap(
                        spacing: 8,
                        children: [
                          TChoiceChip(text: 'All Size', selected: true, onSelected: (value){}),
                        ],
                      )
      ],
    );
  }
}