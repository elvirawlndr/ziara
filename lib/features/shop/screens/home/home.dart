import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/common/widgets/home_categories.dart';
import 'package:ziara/common/widgets/primary_header_container.dart';
import 'package:ziara/common/widgets/product_card_vertical.dart';
import 'package:ziara/data/models/product.dart';
import 'package:ziara/data/repositories/authentication/authentication_repository.dart';
import 'package:ziara/features/personalization/models/usermodel.dart';
import 'package:ziara/features/shop/controllers/product_controller.dart';
import 'package:ziara/features/shop/screens/product_detail/product_detail.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/text_strings.dart';
part "../../../../common/widgets/search_container.dart";
part "../../../../common/widgets/section_heading.dart";
part "../../../../common/widgets/vertical_image_text.dart";
part "t_grid_layout.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository authRepo = AuthenticationRepository.instance;
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<UserModel?>(
                future: authRepo.getUserData(uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('User not found'));
                  } else {
                    UserModel user = snapshot.data!;

                    return TPrimaryHeaderContainer(
                      child: Column(
                        children: [
                          const SizedBox(height: TSizes.spaceBtwItems),
                          TAppBar(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(TTexts.homeAppbarTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(color: TColors.grey)),
                                Text(user.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .apply(color: TColors.grey)),
                              ],
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),

                          // SEARCH BAR
                          TSearchContainer(
                              text: 'Search Product',
                              onSubmitted: (query) {
                                print('Search query: $query');
                              }),
                          const SizedBox(height: TSizes.inputFieldRadius),

                          // CATEGORIES
                          Padding(
                            padding: const EdgeInsets.only(
                                left: TSizes.defaultSpace),
                            child: Column(
                              children: [
                                TSectionHeading(
                                    title: 'Categories',
                                    onPressed: () {},
                                    textColor: TColors.white),
                                const SizedBox(height: TSizes.spaceBtwItems),
                                const THomeCategories(),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                      title: 'You might like',
                      onPressed: () {},
                      textColor: TColors.darkBase),
                  Obx(() {
                    if (productController.products.isEmpty) {
                      return const Center(child: Text('No products available'));
                    }

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemCount: productController.products.length,
                      itemBuilder: (context, index) {
                        final product = productController.products[index];
                        return GestureDetector(
                          onTap: () => Get.to(() => ProductDetailScreen(productId: product.id)),
                          child: Card(
                            color: Colors.white,
                            elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    product.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
