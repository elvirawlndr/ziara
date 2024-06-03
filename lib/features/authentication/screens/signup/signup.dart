import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/authentication/controllers/signup_controller.dart';
import 'package:ziara/features/authentication/screens/login/login.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/text_strings.dart';
import 'package:ziara/validators/valid.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final signupFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const TAppBar(
        
      ),
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
                key: signupFormKey,
                child: Column(
                children: [
                  
                  TextFormField(
                    controller: controller.name,
                    validator: (value) => TValid.validateEmptyText('Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.name,
                      prefixIcon: Icon(Iconsax.user)),
                    ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // email
                  TextFormField(
                    controller: controller.email,
                    validator: (value) => TValid.validateEmail(value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.email,
                      prefixIcon: Icon(Iconsax.message)),
                    ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),


                  // phone number
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) => TValid.validatePhoneNumber(value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.phoneNumber,
                      prefixIcon: Icon(Iconsax.call)),
                    ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // password
                  Obx(
                    () => TextFormField(
                      controller: controller.password,
                      validator: (value) => TValid.validatePassword(value),
                      expands: false,
                      obscureText: controller.hidepassword.value,
                      decoration: InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: const Icon(Iconsax.key),
                        suffixIcon: IconButton(icon: const Icon(Iconsax.eye_slash), onPressed: () => controller.hidepassword.value = !controller.hidepassword.value,)),
                      ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if(signupFormKey.currentState!.validate()) {
                          SignupController.instance.signup();
                        }
                      },
                      child: const Text(TTexts.createAccount, style: TextStyle(fontFamily: 'Poppins')),
                    )
                  )
                  ],
                ),
              ),

            const SizedBox(height: TSizes.spaceBtwItems),
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: Theme.of(context).textTheme.labelMedium, // Normal text style
                children: [
                  TextSpan(
                    text: 'Sign in',
                    style: const TextStyle(color: TColors.darkBase, fontWeight: FontWeight.bold), // Style for the clickable text
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const LoginScreen()); // Navigate to the login page
                      },
                  ),
                ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}