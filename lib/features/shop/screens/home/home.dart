import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/common/widgets/primary_header_container.dart';
import 'package:ziara/common/widgets/product_card_vertical.dart';
import 'package:ziara/device/device_utility.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/text_strings.dart';
part "../../../../common/widgets/search_container.dart";
part "../../../../common/widgets/section_heading.dart";
part "../../../../common/widgets/vertical_image_text.dart";
part "../../../../common/widgets/home_categories.dart";


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
                        Text(TTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.grey)),
                      ],
                    ),
                    /*actions: [
                      Stack(
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Iconsax.shopping_bag, color: TColors.white)),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: TColors.black,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white)),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                    */
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // SEARCH BAR
                  const TSearchContainer(text: 'Search Product'),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // CATEGORIES
                  const Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(title: 'Categories', showActionButton: false, textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        THomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  SizedBox(
                    height: 500,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: TSizes.gridViewSpacing,
                        crossAxisSpacing: TSizes.gridViewSpacing,
                        mainAxisExtent: 288,
                      ), 
                        itemBuilder: (_, index) => const TProductCardVertical(),
                    ),
                  ),
                ],
              ),  
            )
          ],
        ),
      ),
    );
  }
}

