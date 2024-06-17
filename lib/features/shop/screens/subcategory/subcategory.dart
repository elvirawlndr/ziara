import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/shop/controllers/product_controller.dart';
import 'package:ziara/features/shop/screens/product_detail/product_detail.dart';
import 'package:ziara/utils/const/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  final String category;

  const SubCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    //productController.fetchProductsByCategory(category);

     WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.fetchProductsByCategory(category);
    });

    return Scaffold(
      appBar: TAppBar(
        title: Text(category, style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                if (productController.productsByCategory.isEmpty) {
                  return const Center(child: Text('No products available'));
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 290,
                  ),
                  itemCount: productController.productsByCategory.length,
                  itemBuilder: (context, index) {
                    final product = productController.productsByCategory[index];
                    return GestureDetector(
                      onTap: () => Get.to(() => ProductDetailScreen(productId: product.id)),
                      child: Card(
                        elevation: 1,
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 280,
                                  height: 200,
                                  margin: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 250,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Image.network(
                                        product.imageUrl,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
