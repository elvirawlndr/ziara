import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ziara/features/shop/models/address_model.dart';

class AddressRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final snapshot = await _firestore.collection('addresses').where('uid', isEqualTo: uid).get();

      return snapshot.docs.map((doc) => AddressModel.fromJson(doc.data())).toList();
    } catch (e) {
      throw 'Error fetching addresses: $e';
    }
  }

  Future<void> addAddress(AddressModel newAddress) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      newAddress = newAddress.copyWith(uid: uid);  // Update the uid in the newAddress model
      await _firestore.collection('addresses').add(newAddress.toJson());
    } catch (e) {
      throw 'Error adding address: $e';
    }
  }
}
