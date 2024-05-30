part of "checkout.dart"; 
class TCheckoutItem extends StatelessWidget {
  const TCheckoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    TRoundedImage(
                      image: TImages.hoodie_1,
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkergrey : TColors.lightBase,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TProductTitleText(title: 'Comfort Hoodie', maxLines: 1),
                      
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Size: ', style: Theme.of(context).textTheme.bodySmall),
                                TextSpan(text: 'M', style: Theme.of(context).textTheme.bodyLarge),
                              ]
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                );
  }
}