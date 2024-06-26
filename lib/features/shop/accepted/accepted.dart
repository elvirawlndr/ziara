import 'package:flutter/material.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/sizes.dart';

class AcceptedScreen extends StatelessWidget {
  const AcceptedScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

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
              Icon(Icons.card_giftcard_rounded, size: THelperFunctions.screenWidth() * 0.6, color: TColors.darkBase),
              const SizedBox(height: TSizes.spaceBtwSections),

              Text('Order Accepted!', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text('Thanks for shopping at Ziara!\nYour style, our pleasure. Until next time!', style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: 70),

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