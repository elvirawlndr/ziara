import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ziara/features/personalization/models/usermodel.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.email).set(user.toJson());
    } on FirebaseException catch (e) {
      throw 'An error occured: ${e.message}';
    } on FormatException catch(e) {
      throw 'Invalid data format: ${e.message}';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}