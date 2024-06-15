part of "checkout.dart";

class TBillingAmountSection extends StatelessWidget {
  final ProductModel product;
  const TBillingAmountSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyLarge),
            TProductPriceText(price: product.price, isLarge: false)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2)
      ],
    );
  }
}

