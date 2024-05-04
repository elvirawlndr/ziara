import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding (
          padding: const EdgeInsets.only(
            top: TSizes.appBarHeight,
            left: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      height: 150,
                      image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
                    ),
                  ),
                  Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),

              Form(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                child: Column(
                  children: [
                    // email
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.message), labelText: TTexts.email),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                
                    // password
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.key), labelText: TTexts.password, suffixIcon: Icon(Iconsax.eye_slash),),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields/2),
                
                    const SizedBox(height: TSizes.spaceBtwSections),
                
                    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text(TTexts.signIn, style: TextStyle(fontFamily: 'Poppins')),)),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    
                    SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text(TTexts.createAccount, style: TextStyle(fontFamily: 'Poppins'),))),
                
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Divider(color: dark ? TColors.darkgrey: TColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
                Text(TTexts.orSignInWith, style: Theme.of(context).textTheme.labelMedium),
                Flexible(child: Divider(color: dark ? TColors.darkgrey: TColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections/2),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      width: TSizes.iconMd,
                      height: TSizes.iconMd,
                      image: AssetImage(TImages.google),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }

}