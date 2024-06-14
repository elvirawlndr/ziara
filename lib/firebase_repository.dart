import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository {
  static Future<List<Product>> fetchProductsFromFirestore() async {
    List<Product> products = [];

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('products').get();

    snapshot.docs.forEach((doc) {
      products.add(Product(
        title: doc['title'],
        description: doc['description'],
        imageURL: doc['imageURL'],
        price: doc['price'],
      ));
    });

    return products;
  }
}

class Product {
  final String title;
  final String description;
  final String imageURL;
  final double price;

  Product({
    required this.title,
    required this.description,
    required this.imageURL,
    required this.price
  });
}
