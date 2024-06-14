
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziara/common/styles/rounded_container.dart';
import 'package:ziara/common/styles/rounded_image.dart';
import 'package:ziara/common/widgets/products/product_title.dart';
import 'package:ziara/data/models/product.dart';
import 'package:ziara/features/shop/screens/product_detail/product_detail.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/shadows.dart';
import 'package:ziara/utils/const/sizes.dart';


class TProductCardVertical extends StatelessWidget {
  final Product product;
  const TProductCardVertical({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkergrey : TColors.lightBase,
        ),
      
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.darkBase : TColors.lightBase,
              child: Stack(
                children: [
                  TRoundedImage(image: product.image, applyImageRadius: true),
      
                  Positioned(
      
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.darkBase.withOpacity(0.03),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    ),
                  ),
      
                  //const Positioned(
                    //top: 0, 
                    //right: 0, 
                    //child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red)
                  //),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2),
      
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title),
                  const SizedBox(height: TSizes.spaceBtwItems/2),
                  Row(
                    children: [
                      Text(product.brand, overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(width: TSizes.xs)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.price,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.darkBase,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(width: TSizes.iconLg * 1.2, height: TSizes.iconLg * 1.2, child: Center(child:Icon(Iconsax.add, color: TColors.white)))
                      )
                    ],
                  ),
                  
                ],
      
              ),
            )
          ],
        ),
      ),
    );
  }
}