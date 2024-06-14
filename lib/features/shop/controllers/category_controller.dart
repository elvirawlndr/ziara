import 'package:get/get.dart';
import 'package:ziara/data/repositories/categories/category_repository.dart';
import 'package:ziara/features/shop/models/category_model.dart';
import 'package:ziara/utils/const/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(6)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh, snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
