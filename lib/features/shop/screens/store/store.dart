import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/data/models/product.dart';
import 'package:ziara/features/shop/controllers/product_controller.dart';
import 'package:ziara/features/shop/screens/home/home.dart';
import 'package:ziara/features/shop/screens/product_detail/product.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';


/*
class StoreScreen extends StatelessWidget {
  final List<Product> subCategoryProduct = [
    Product(image: TImages.hoodie_1, title: 'Comfort Hoodie', brand: 'Ziara Men', price: 'Rp600.000'),
    Product(image: TImages.hoodie_2, title: 'Classic Hoodie', brand: 'Ziara Women', price: 'Rp450.000'),
    Product(image: TImages.pants_1, title: 'Sleek Pants', brand: 'Ziara Men', price: 'Rp300.000'),
    Product(image: TImages.pants_2, title: 'Urban Pants', brand: 'Ziara Women', price: 'Rp400.000'),
    Product(image: TImages.jacket_1, title: 'Ride Jacket', brand: 'Ziara Men', price: 'Rp720.000'),
  ];

  StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Products', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(products: subCategoryProduct)
            ],
          ),
          ),
      ),
    );
  }
}
*/

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(() => const AddProductScreen());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (productController.products.isEmpty) {
          return const Center(child: Text('No products available'));
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Ubah jumlah kolom di sini
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return Card(
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      product.imageUrl, // Menggunakan URL gambar dari model produk
                      fit: BoxFit.cover,
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
            );
          },
        );
      }),
    );
  }
}
