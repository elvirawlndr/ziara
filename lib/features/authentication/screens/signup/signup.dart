import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: TSizes.defaultSpace,
            left: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
            right: TSizes.defaultSpace
          ),
          child: Column(
            children: [
              // title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              // form
              Form(
                child: Column(
                children: [
                  
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.name,
                      prefixIcon: Icon(Iconsax.user)),
                    ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // email
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.email,
                      prefixIcon: Icon(Iconsax.message)),
                    ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // phone number
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.phoneNumber,
                      prefixIcon: Icon(Iconsax.call)),
                    ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // password
                  TextFormField(
                    expands: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.key),
                      suffixIcon: Icon(Iconsax.eye_slash)),
                    ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text(TTexts.createAccount, style: TextStyle(fontFamily: 'Poppins')),)),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  
                  ],
                ),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Divider(color: dark ? TColors.darkgrey: TColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
                Text(TTexts.orSignUpWith, style: Theme.of(context).textTheme.labelMedium),
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