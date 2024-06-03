import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziara/features/authentication/controllers/login_controller.dart';
import 'package:ziara/features/authentication/screens/signup/signup.dart';
import 'package:ziara/helper/helper_functions.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/text_strings.dart';
import 'package:ziara/validators/valid.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final loginFormKey = GlobalKey<FormState>();
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      height: 150,
                      image: AssetImage(dark ? TImages.lightClearAppLogo : TImages.darkClearAppLogo),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),

              Form(
                key: loginFormKey,
                child: Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                child: Column(
                  children: [
                    // email
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => TValid.validateEmail(value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.message), labelText: TTexts.email),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                
                    // password
                    Obx(
                    () => TextFormField(
                      controller: controller.password,
                      obscureText: controller.hidePassword.value,
                      validator: (value) => TValid.validatePassword(value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.key), 
                        labelText: TTexts.password, 
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =  !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
                    ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields/2),
                
                    const SizedBox(height: TSizes.spaceBtwSections),
                
                    // sign in button
                    SizedBox(width: double.infinity, child: ElevatedButton(
                      onPressed: () {
                      if (loginFormKey.currentState!.validate()) {
                        controller.login(context);
                        }
                        },
                        child: const Text(TTexts.signIn, style: TextStyle(fontFamily: 'Poppins')),)),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    
                    // sign up button
                    SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignUpScreen()), child: const Text(TTexts.createAccount, style: TextStyle(fontFamily: 'Poppins'),))),
                
                  ],
                ),
              ),
            ),
            /*
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
            */
            ],
          ),
        ),
      ),
    );
  }

}