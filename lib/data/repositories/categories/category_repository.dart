import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:ziara/features/shop/models/category_model.dart";

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw 'Error: $e';
    } on PlatformException catch (e) {
      throw 'Error: $e';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
