import 'package:flutter/material.dart';
import 'package:ziara/common/widgets/products/product_title.dart';
import 'package:ziara/features/shop/screens/product_detail/product_price_text.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            TProductTitleText(title: 'Comfort Hoodie'),
            TProductPriceText(price: 600000)
          ],
        )
      ],
    );
  }
}