
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziara/common/styles/rounded_container.dart';
import 'package:ziara/common/styles/rounded_image.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/common/widgets/products/product_title.dart';
import 'package:ziara/features/shop/screens/home/home.dart';
import 'package:ziara/features/shop/screens/product_detail/product_price_text.dart';
import 'package:ziara/features/shop/success/success.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/nav_menu.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';
part "t_checkout_item.dart";
part "t_billing_payment_section.dart";
part "t_billing_address_section.dart";
part "t_billing_amount_section.dart";


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 1,
            separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
            itemBuilder: (_, index) => Column(
              children: [
                const TCheckoutItem(),
                const SizedBox(height: TSizes.spaceBtwItems),


                TRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                  child: const  Column(
                    children: [
                      TBillingAmountSection(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      Divider(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      TBillingPaymentSection(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      TBillingAddressSection()
                    ],

                  ),
                )
              ],
            ),

          ),
          )
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(
              () => SuccessScreen(
                image: TImages.success,
                title: 'Payment Success!',
                subTitle: 'Thank you for purchasing!',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              ),
            ),
            child: const Text('Checkout Rp 600.000', style: TextStyle(fontFamily: 'Poppins'),),
          ),
        ),
    );
  }
}