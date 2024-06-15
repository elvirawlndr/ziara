import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ziara/common/styles/rounded_container.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/shop/accepted/accepted.dart';
import 'package:ziara/nav_menu.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';

class DetailOrderScreen extends StatelessWidget {
  final String orderId;

  const DetailOrderScreen({super.key, required this.orderId});

  Future<Map<String, dynamic>> _fetchOrderDetails() async {
    DocumentSnapshot<Map<String, dynamic>> orderDoc =
        await FirebaseFirestore.instance.collection('orders').doc(orderId).get();

    if (orderDoc.exists) {
      return orderDoc.data()!;
    } else {
      throw Exception('Order not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Detail Order', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchOrderDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Order not found'));
          } else {
            var orderData = snapshot.data!;
            var productData = orderData['product'];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    // Display the product image
                    Image.network(productData['imageUrl'], width: 350, height: 350),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Display order details
                    TRoundedContainer(
                      showBorder: true,
                      padding: const EdgeInsets.all(TSizes.md),
                      backgroundColor: TColors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Product Name', style: Theme.of(context).textTheme.bodySmall),
                              Text(productData['name'], style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: TSizes.sm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal', style: Theme.of(context).textTheme.bodySmall),
                              Text('Rp ${productData['price']}', style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: TSizes.sm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Transaction ID', style: Theme.of(context).textTheme.bodySmall),
                              Text(orderData['transactionId'], style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: TSizes.sm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date', style: Theme.of(context).textTheme.bodySmall),
                              Text(orderData['date'], style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: TSizes.sm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Status', style: Theme.of(context).textTheme.bodySmall),
                              Text(orderData['status'], style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
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
