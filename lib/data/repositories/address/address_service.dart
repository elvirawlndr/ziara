import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ziara/features/shop/models/address_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddressService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchAddresses() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return [];
    }

    try {
      QuerySnapshot snapshot = await _firestore
          .collection('addresses')
          .where('uid', isEqualTo: user.uid)  // Filter by user UID
          .get();
      return snapshot.docs.map((doc) => AddressModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print('Error fetching addresses: $e');
      return [];
    }
  }
}
