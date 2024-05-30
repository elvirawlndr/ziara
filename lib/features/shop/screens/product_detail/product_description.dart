import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';

class TProductDescription extends StatelessWidget {
  const TProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'This is a very long description of the product. It contains all the details that a customer might want to know before making a purchase decision.',
          style: TextStyle(color: TColors.darkergrey),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
