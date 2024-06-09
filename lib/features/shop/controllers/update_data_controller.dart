import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateDataController extends GetxController {
  static UpdateDataController get instance => Get.find();

  final name = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  
}