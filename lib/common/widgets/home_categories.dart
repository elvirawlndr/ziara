import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/features/shop/controllers/category_controller.dart';
import 'package:ziara/features/shop/screens/subcategory/subcategory.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (categoryController.featuredCategories.isEmpty) {
        return const Center(child: Text('No categories available.'));
      }

      return SizedBox(
        height: 150,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return GestureDetector(
              onTap: () => Get.to(
                  () => SubCategoryScreen(category: category.name)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal:
                        8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Image.network(
                          category.image,
                          height: 50,
                          width: 50,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.broken_image,
                                size: 50, color: Colors.red);
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ), 
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
