import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/styles/rounded_container.dart';
import 'package:ziara/common/styles/rounded_image.dart';
import 'package:ziara/common/widgets/products/product_title.dart';
import 'package:ziara/features/shop/orders/detail_order.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});
  
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: TColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const TRoundedImage(
                      image: TImages.hoodie_1,
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.all(TSizes.sm),
                      backgroundColor: TColors.lightBase,
                    ),
                    const SizedBox(width: TSizes.sm),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TProductTitleText(title: 'Comfort Hoodie', maxLines: 1),
                      
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Status: ', style: Theme.of(context).textTheme.bodySmall),
                                TextSpan(text: 'Processing', style: Theme.of(context).textTheme.bodyLarge),
                              ]
                            )
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '2024-06-05 | 12:02', style: Theme.of(context).textTheme.bodySmall),
                              ]
                            )
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(()=> const DetailOrderScreen());
                      },
                      child: const Icon(Icons.keyboard_arrow_right)
                    )
            ],
          )
        ],
      ),
    );
  }

  
}