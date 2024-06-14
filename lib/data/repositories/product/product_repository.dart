import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ziara/features/shop/models/product_model.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all products from Firestore
  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final snapshot = await _firestore.collection('products').get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList();
    } catch (e) {
      throw 'Error fetching products: $e';
    }
  }

  // Add a new product to Firestore
  Future<void> addProduct(ProductModel product) async {
    try {
      await _firestore.collection('products').doc(product.id).set(product.toJson());
    } catch (e) {
      throw 'Error adding product: $e';
    }
  }
}
