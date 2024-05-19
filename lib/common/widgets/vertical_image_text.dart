part of "../../features/shop/screens/home/home.dart"; 
class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({super.key, required this.image, required this.title, this.textColor = TColors.white, this.backgroundColor = TColors.white, this.onTap});

  final String image;
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56, 
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.black : TColors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image(image: const AssetImage(TImages.shirtIcon), fit: BoxFit.cover, color: dark ? TColors.darkBase : TColors.white),
              ),
            ),
              const SizedBox(height: TSizes.spaceBtwItems/2),
                SizedBox(
                  width: 55,
                  child: Text(
                    'Hoodie',
                    style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                
          ],
        ),
      ),
    );
  }
}