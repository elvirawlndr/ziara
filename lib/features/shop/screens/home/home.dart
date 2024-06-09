import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/common/widgets/home_categories.dart';
import 'package:ziara/common/widgets/primary_header_container.dart';
import 'package:ziara/common/widgets/product_card_vertical.dart';
import 'package:ziara/data/models/product.dart';
import 'package:ziara/data/repositories/authentication/authentication_repository.dart';
import 'package:ziara/features/personalization/models/usermodel.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/text_strings.dart';
part "../../../../common/widgets/search_container.dart";
part "../../../../common/widgets/section_heading.dart";
part "../../../../common/widgets/vertical_image_text.dart";
part "t_grid_layout.dart";


class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(image: TImages.hoodie_1, title: 'Comfort Hoodie', brand: 'Ziara Men', price: 'Rp600.000'),
    Product(image: TImages.hoodie_2, title: 'Classic Hoodie', brand: 'Ziara Women', price: 'Rp450.000'),
    Product(image: TImages.pants_1, title: 'Sleek Pants', brand: 'Ziara Men', price: 'Rp300.000'),
    Product(image: TImages.pants_2, title: 'Urban Pants', brand: 'Ziara Women', price: 'Rp400.000'),
    Product(image: TImages.jacket_1, title: 'Ride Jacket', brand: 'Ziara Men', price: 'Rp720.000'),
    Product(image: TImages.tshirt_1, title: 'Classic T-Shirt', brand: 'Ziara Women', price: 'Rp250.000'),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository authRepo = AuthenticationRepository.instance;
    final String uid = FirebaseAuth.instance.currentUser!.uid;

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
                        Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
                        Text(user.name, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.grey)),
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
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(title: 'Categories', onPressed: (){}, textColor: TColors.white),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        const THomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        }
      ),

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(title: 'Most Popular', onPressed: (){}, textColor: TColors.darkBase),
                  TGridLayout(products: products)
                ],
              ),  
            )
          ],
        ),
      ),
    );
  }
}

