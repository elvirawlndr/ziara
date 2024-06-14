part of "checkout.dart";

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyLarge),
            const TProductPriceText(price: 600.000, isLarge: false)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2)
      ],
    );
  }
}

