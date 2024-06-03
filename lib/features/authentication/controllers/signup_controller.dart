import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/data/repositories/authentication/authentication_repository.dart';
import 'package:ziara/nav_menu.dart';
import 'package:ziara/utils/const/colors.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final name = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final hidepassword = true.obs;
  final signupFormKey = GlobalKey<FormState>();
  var profilePicture = '';
  var address = '';
  final isLoading = false.obs;

  Future<void> signup() async {
    if (signupFormKey.currentState?.validate() ?? false) {
      isLoading.value = true;
    }
    try {
      await AuthenticationRepository.instance.createUserWithEmailAndPassword(email.text.trim(), password.text.trim(), name.text.trim(), phoneNumber.text.trim(), profilePicture, address);   
      Get.snackbar('Success', 'Account created successfully', snackPosition: SnackPosition.BOTTOM, backgroundColor: TColors.lightBase);  
      Get.to(() => const NavigationMenu());
      
    } catch (e, stackTrace) {
      debugPrint('Signup Error: $e');
      debugPrint('Stack Trace: $stackTrace');
      Get.snackbar('Error', 'Failed to create account: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
