import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/styles/rounded_container.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/shop/accepted/accepted.dart';
import 'package:ziara/features/shop/screens/checkout/checkout.dart';
import 'package:ziara/nav_menu.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Detail Order', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCheckoutItem(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal', style: Theme.of(context).textTheme.bodySmall),
                        Text('Rp 600.000', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: TSizes.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Transaction ID', style: Theme.of(context).textTheme.bodySmall),
                        Text('123456789', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: TSizes.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date', style: Theme.of(context).textTheme.bodySmall),
                        Text('2024-06-05 | 12:02', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: TSizes.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status', style: Theme.of(context).textTheme.bodySmall),
                        Text('Processing', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                  ],
                  
                ),
                
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(TSizes.defaultSpace, TSizes.defaultSpace, TSizes.defaultSpace, TSizes.defaultSpace + 32),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.to(
                () => AcceptedScreen(
                  image: TImages.success,
                  title: 'Payment Success!',
                  subTitle: 'Thank you for purchasing!',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                )
              );
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.darkBase, 
              side: BorderSide.none, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
    ),
            ),
            child: const Text(
              'Accepted', 
              style: TextStyle(color: TColors.white, fontFamily: 'Poppins')
            ),
          ),
        ),
      ),
    );
  }
}
