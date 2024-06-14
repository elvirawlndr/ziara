import 'package:flutter/material.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/data/models/product.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  final List<Product> subCategoryProduct = [
    Product(image: TImages.hoodie_1, title: 'Comfort Hoodie', brand: 'Ziara Men', price: 'Rp600.000'),
    Product(image: TImages.hoodie_2, title: 'Classic Hoodie', brand: 'Ziara Women', price: 'Rp450.000'),
    Product(image: TImages.pants_1, title: 'Sleek Pants', brand: 'Ziara Men', price: 'Rp300.000'),
    Product(image: TImages.pants_2, title: 'Urban Pants', brand: 'Ziara Women', price: 'Rp400.000'),
    Product(image: TImages.jacket_1, title: 'Ride Jacket', brand: 'Ziara Men', price: 'Rp720.000'),
  ];

  SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Hoodie', style: Theme.of(context).textTheme.headlineMedium), showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //TGridLayout(products: subCategoryProduct)
            ],
          ),
          ),
      ),
    );
  }
}