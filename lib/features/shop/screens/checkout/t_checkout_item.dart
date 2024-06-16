part of "checkout.dart"; 
class TCheckoutItem extends StatelessWidget {
  final ProductModel product;
  const TCheckoutItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    Image.network(
                      product.imageUrl,
                      width: 60,
                      height: 60,
                    ),
                  
                    const SizedBox(width: TSizes.spaceBtwItems),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TProductTitleText(title: product.name, maxLines: 1),
                      
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Size: ', style: Theme.of(context).textTheme.bodySmall),
                                TextSpan(text: 'All Size', style: Theme.of(context).textTheme.bodyLarge),
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