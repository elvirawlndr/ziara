import 'package:ziara/features/shop/models/category_model.dart';
import 'package:ziara/utils/const/image_strings.dart';

class TDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: TImages.hoodie_1, name: 'Hoodie', isFeatured: true),
    CategoryModel(
        id: '2', image: TImages.jacket_1, name: 'Jacket', isFeatured: true),
    CategoryModel(
        id: '3', image: TImages.pants_2, name: 'Pants', isFeatured: true),
    CategoryModel(
        id: '4', image: TImages.shirt_2, name: 'Shirt', isFeatured: true),
    CategoryModel(
        id: '5', image: TImages.tshirt_1, name: 'T-Shirt', isFeatured: true),
    CategoryModel(
        id: '6', image: TImages.cap_1, name: 'Accessories', isFeatured: true),
  ];
}
