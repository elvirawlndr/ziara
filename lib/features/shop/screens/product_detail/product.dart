import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/features/shop/controllers/product_controller.dart';
import 'package:ziara/features/shop/models/product_model.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController imageUrlController = TextEditingController();
    final ProductController productController = ProductController.instance;
    final uuid = Uuid();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final newProduct = ProductModel(
                  id: uuid.v4(),
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  description: descriptionController.text,
                  imageUrl: imageUrlController.text,
                );
                await productController.addProduct(newProduct);
                Get.back();
              },
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
