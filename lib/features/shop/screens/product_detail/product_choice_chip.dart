import 'package:flutter/material.dart';
import 'package:ziara/utils/const/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? TColors.white : null),
    );
  }
}