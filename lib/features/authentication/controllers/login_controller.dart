import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ziara/data/repositories/authentication/authentication_repository.dart';
import 'package:ziara/nav_menu.dart';
import 'package:ziara/utils/const/colors.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    debugPrint('halo');
    
      try {
        await AuthenticationRepository.instance.signInWithEmailAndPassword(email.text.trim(), password.text.trim(), context);
        Get.snackbar('Success', 'Login successfully', snackPosition: SnackPosition.BOTTOM, backgroundColor: TColors.lightBase);  
        Get.offAll(() => const NavigationMenu());
      } catch (e, stackTrace) {
        debugPrint('Login Error: $e');
        debugPrint('Stack Trace: $stackTrace');
        Get.snackbar('Error', 'Login failed: ${e.toString()}',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } finally {
        isLoading.value = false;
      }
    }
  }
