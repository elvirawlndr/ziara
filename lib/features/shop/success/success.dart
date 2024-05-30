import 'package:flutter/material.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Image(image: AssetImage(image), width: THelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: TSizes.spaceBtwSections),

              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: 100),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onPressed, child: const Text('Continue', style: TextStyle(fontFamily: 'Poppins'),),),
              )
            ],
          ),
        ),
      ),
    ));
  }
}