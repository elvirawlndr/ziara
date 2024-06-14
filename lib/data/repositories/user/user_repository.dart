import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ziara/features/personalization/models/usermodel.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.put(UserRepository());

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("users").doc(user.email).set(user.toJson());
    } on FirebaseException catch (e) {
      throw 'An error occured: ${e.message}';
    } on FormatException catch(e) {
      throw 'Invalid data format: ${e.message}';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserModel> getUserData(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await _db.collection('users').doc(uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Error fetching user data: $e';
    }
  }

  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("users").doc(updatedUser.uid).update(updatedUser.toJson());
    } catch (e) {
      throw 'Error update user data: $e';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("users").doc().update(json);
    } catch (e) {
      throw 'Error update user data: $e';
    }
  }

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("users").doc(userId).delete();
    } catch (e) {
      throw 'Error remove user data: $e';
    }
  }
}