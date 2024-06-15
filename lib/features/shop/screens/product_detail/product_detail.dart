import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/personalization/models/usermodel.dart';
import 'package:ziara/features/shop/controllers/product_controller.dart';
import 'package:ziara/features/shop/screens/checkout/checkout.dart';
import 'package:ziara/features/shop/screens/product_detail/product_description.dart';
import 'package:ziara/features/shop/screens/product_detail/product_price_text.dart';
import 'package:ziara/features/shop/screens/product_detail/product_size.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    final product = productController.getProductById(productId);
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product.imageUrl, width: 350, height: 350),
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
                              Text(product.name, style: Theme.of(context).textTheme.headlineSmall) 
                          ),
                          TProductPriceText(price: product.price),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TProductDescription(description: product.description),
                      const SizedBox(height: 20),
                      const TProductSize(),
                      const SizedBox(height: 20),


                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => CheckoutScreen(product: product)),
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