part of "checkout.dart";

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){}),
        Text('Ziara', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: TSizes.spaceBtwItems),


        Row(
          children: [
            const Icon(Iconsax.call, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('+62 812 3456 7890', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Iconsax.map, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: Text('Bekasi, Indonesia', style: Theme.of(context).textTheme.bodyMedium, softWrap: true))
          ],
        )
      ],
    );
  }
}