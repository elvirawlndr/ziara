import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/shop/screens/checkout/checkout.dart';
import 'package:ziara/features/shop/screens/product_detail/product_description.dart';
import 'package:ziara/features/shop/screens/product_detail/product_price_text.dart';
import 'package:ziara/features/shop/screens/product_detail/product_size.dart';
import 'package:ziara/utils/const/image_strings.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage(TImages.hoodie_1), width: 350, height: 350,),
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: 
                              Text('Comfort Hoodie', style: Theme.of(context).textTheme.headlineSmall) 
                          ),
                          const TProductPriceText(price: 600.000),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const TProductDescription(),
                      const SizedBox(height: 20),
                      const TProductSize(),
                      const SizedBox(height: 20),


                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const CheckoutScreen()),
                          child: const Text('Checkout', style: TextStyle(fontFamily: 'Poppins'))),
                      )
                      
                  ],
                    ),
                ),
            ),
          ],
        ),
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: TAppBar(
        showBackArrow: true,
        actions: [
          //TCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
        ],
      ),
    ));
  }
}