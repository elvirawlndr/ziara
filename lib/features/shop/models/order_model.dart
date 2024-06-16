import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ziara/features/shop/models/product_model.dart';

class OrderModel {
  final String id;
  final ProductModel product;
  final String status;
  final DateTime dateTime;

  OrderModel({
    required this.id,
    required this.product,
    required this.status,
    required this.dateTime,
  });

  factory OrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data()!;
    return OrderModel(
      id: snapshot.id,
      product: ProductModel.fromJson(data['product']),
      status: data['status'],
      dateTime: data['dateTime'],
    );
  }
}
