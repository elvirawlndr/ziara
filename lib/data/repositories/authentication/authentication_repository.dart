import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/features/authentication/screens/login/login.dart';
import 'package:ziara/nav_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
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

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const NavigationMenu()) : Get.to(() => const LoginScreen());
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
      UserCredential userCredential = 
        await _auth.signInWithEmailAndPassword(email: email, password: password);
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
}
