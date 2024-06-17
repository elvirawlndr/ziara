import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ziara/features/shop/models/product_model.dart';
import 'package:ziara/data/repositories/product/product_repository.dart';
import 'package:ziara/utils/const/loaders.dart';
import 'package:ziara/features/shop/models/order_model.dart';


class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxList<ProductModel> productsByCategory = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());
  var orders = <OrderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
    fetchOrders();
  }

  // Fetch all products
  Future<void> fetchAllProducts() async {
    try {
      final fetchedProducts = await productRepository.fetchAllProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Add a new product
  Future<void> addProduct(ProductModel product) async {
    try {
      await productRepository.addProduct(product);
      TLoaders.successSnackBar(title: 'Success', message: 'Product added successfully');
      fetchAllProducts();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  ProductModel getProductById(String id) {
    return products.firstWhere((product) => product.id == id);
  }

  void fetchOrders() async {
    try {
      var orderSnapshots = await FirebaseFirestore.instance.collection('orders').get();
      var orderList = orderSnapshots.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
      orders.assignAll(orderList);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<ProductModel> fetchProductById(String id) async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(id)
          .get();
      return ProductModel.fromJson(snapshot.data()!);
    } catch (e) {
      throw Exception('Failed to fetch product: $e');
    }
  }

    // Fetch products by category
  Future<void> fetchProductsByCategory(String category) async {
    try {
      print('Fetching products for category: $category');
      final fetchedProducts = await productRepository.fetchProductsByCategory(category);
      print('Fetched products: ${productsByCategory.length}');
      productsByCategory.assignAll(fetchedProducts);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> saveOrder(OrderModel order) async {
    // Save order to local observable list
    orders.add(order);

    // Save order to Firestore (or other database)
    // Replace the following line with your Firestore save logic
    await FirebaseFirestore.instance.collection('orders').add(order.toJson());
  }
}
