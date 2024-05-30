import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/text_strings.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Edit Profile', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage(TImages.profile))),
                  ),
                  Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: TColors.buttonSecondary.withOpacity(0.1)),
                    child: const Icon(
                      Iconsax.edit,
                      size: 20,
                    ),
                  ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
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
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: 500,
                      child: ElevatedButton(
                        onPressed: () {}, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.darkBase, side: BorderSide.none, shape: const StadiumBorder()
                        ),
                        child: const Text('Save Changes', style: TextStyle(color: TColors.white, fontFamily: 'Poppins')),
                      ),          
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}