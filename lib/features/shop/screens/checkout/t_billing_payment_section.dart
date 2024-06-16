part of "checkout.dart"; 

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TSectionHeading(title: 'Payment Method'),
        const SizedBox(height: TSizes.spaceBtwItems/2),

        Row(
          children: [
            const Icon(Iconsax.card5, color: Color.fromRGBO(224, 224, 224, 1), size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Bank Transfer', style: Theme.of(context).textTheme.bodyMedium)
          ],
        )
      ],
    );
  }
}