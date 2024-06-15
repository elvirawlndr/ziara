import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getOrderDetails(String orderId) async {
    DocumentSnapshot<Map<String, dynamic>> orderDoc = 
        await _firestore.collection('orders').doc(orderId).get();

    if (orderDoc.exists) {
      return orderDoc.data()!;
    } else {
      throw Exception('Order not found');
    }
  }
}
