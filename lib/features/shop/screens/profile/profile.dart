import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/data/repositories/authentication/authentication_repository.dart';
import 'package:ziara/features/personalization/models/usermodel.dart';
import 'package:ziara/features/shop/screens/profile/edit_profile.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository authRepo = AuthenticationRepository.instance;
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: TAppBar(
        title: Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              FutureBuilder<UserModel?>(
                future: authRepo.getUserData(uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('User not found'));
                  } else {
                    UserModel user = snapshot.data!;

                    return Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(image: AssetImage(TImages.profile)),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: TColors.buttonSecondary.withOpacity(0.1),
                                ),
                                child: const Icon(
                                  Iconsax.edit,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(user.name, style: Theme.of(context).textTheme.headlineSmall),
                        Text(user.email, style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 280,
                          child: ElevatedButton(
                            onPressed: () => Get.to(const EditProfileScreen()), 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.darkBase, 
                              side: BorderSide.none, 
                              shape: const StadiumBorder()
                            ),
                            child: const Text('Edit Profile', style: TextStyle(color: TColors.white, fontFamily: 'Poppins')),
                          ),          
                        ),
                        const SizedBox(height: 30),
                        const Divider(),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            AuthenticationRepository.instance.logout();
                          },
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: TColors.buttonSecondary.withOpacity(0.1),
                              ),
                              child: const Icon(Iconsax.logout, color: TColors.buttonSecondary),
                            ),
                            title: Text('Logout', style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
