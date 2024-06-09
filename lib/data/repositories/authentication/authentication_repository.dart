import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/features/authentication/screens/login/login.dart';
import 'package:ziara/features/personalization/models/usermodel.dart';
import 'package:ziara/nav_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, screenRedirect);
  }

  screenRedirect(User? user) {
    user == null ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const NavigationMenu());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password, String name, String phoneNumber, String profilePicture, String address) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
          UserModel userModel = UserModel(uid: user.uid, name: name, email: user.email!, phoneNumber: phoneNumber, profilePicture: profilePicture, address: address);
          await _firestore.collection('users').doc(user.uid).set(userModel.toJson());
          firebaseUser.value != null ? Get.offAll(() => const NavigationMenu()) : Get.to(() => const LoginScreen());
        }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        throw 'The email address is invalid';
      } else {
        throw 'An unknown error occured: ${e.message}';
      }
    } on FormatException catch(e) {
      throw 'Invalid data format: ${e.message}';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationMenu()));
    } on FirebaseAuthException catch(e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided';
      } else {
        throw 'An unknown error occurred: ${e.message}';
      }
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> logout() async => await _auth.signOut();

  Future<UserModel> getUserData(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await _firestore.collection('users').doc(uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Error fetching user data: $e';
    }
  }

  Future<void> updateUserData(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).update(user.toJson());
    } catch (e) {
      throw 'Error updating user data: $e';
    }
  }
}
