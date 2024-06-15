import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';

class TProductDescription extends StatelessWidget {
  const TProductDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: const TextStyle(color: TColors.darkergrey),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
