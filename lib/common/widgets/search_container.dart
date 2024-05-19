part of "../../features/shop/screens/home/home.dart"; 
class TSearchContainer extends StatelessWidget {
  const TSearchContainer({super.key, required this.text, this.icon = Iconsax.search_normal, this.showBackground = true, this.showBorder = true});

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground ? dark ? TColors.darkBase : TColors.lightBase : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          children: [
            const Icon(Iconsax.search_normal, color: TColors.grey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Search Product', style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      )
    );
  }
}