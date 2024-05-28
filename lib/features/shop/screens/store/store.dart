import 'package:flutter/material.dart';
import 'package:ziara/common/styles/rounded_container.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/shop/screens/home/home.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: const[

        ],
      ),
      body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
            expandedHeight: 440,

            flexibleSpace: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSearchContainer(text: 'Search product', showBorder: true, showBackground: false),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  TSectionHeading(title: 'Featured Brands', onPressed: (){}),
                  const SizedBox(height: TSizes.spaceBtwItems/1.5),

                  TRoundedContainer(
                    padding: const EdgeInsets.all(TSizes.sm),
                    showBorder: true,
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          padding: const EdgeInsets.all(TSizes.sm),
                          decoration: BoxDecoration(
                            color: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Image(
                            image: AssetImage(TImages.hoodie_1),                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ];
      }, body: Container()),
    );
  }
}