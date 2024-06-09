part of "checkout.dart"; 

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method'),
        const SizedBox(height: TSizes.spaceBtwItems/2),

        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 32,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.lightBase : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const FittedBox(
                fit: BoxFit.contain,
                child: Icon(Iconsax.card5),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2),
            Text('Bank Transfer', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}