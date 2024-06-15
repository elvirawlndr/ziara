import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/styles/rounded_container.dart';
import 'package:ziara/common/styles/rounded_image.dart';
import 'package:ziara/common/widgets/products/product_title.dart';
import 'package:ziara/features/shop/controllers/product_controller.dart';
import 'package:ziara/features/shop/orders/detail_order.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';

class TOrderListItem extends StatelessWidget {
  final String orderId;
  final String productImage;
  final String productName;
  final String status;
  final String dateTime;

  const TOrderListItem({
    Key? key,
    required this.orderId,
    required this.productImage,
    required this.productName,
    required this.status,
    required this.dateTime,
  }) : super(key: key);

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
              TRoundedImage(
                image: productImage,
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(TSizes.sm),
                backgroundColor: TColors.lightBase,
              ),
              const SizedBox(width: TSizes.sm),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(title: productName, maxLines: 1),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Status: ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: status,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: dateTime,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => DetailOrderScreen(orderId: orderId));
                },
                child: const Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
