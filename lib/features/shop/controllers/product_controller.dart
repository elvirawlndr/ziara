import 'package:get/get.dart';
import 'package:ziara/features/shop/models/product_model.dart';
import 'package:ziara/data/repositories/product/product_repository.dart';
import 'package:ziara/utils/const/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final RxList<ProductModel> products = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
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
}
