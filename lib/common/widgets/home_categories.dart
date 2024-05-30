part of "../../features/shop/screens/home/home.dart"; 
class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
      shrinkWrap: true,
      itemCount: Categories.values.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        final category = Categories.values[index];
        return TVerticalImageText(title: _categoryTitle(category), image: _categoryImage(category), onTap: () => Get.to(SubCategoryScreen()));
      }
    ),
  );
  }

  String _categoryTitle(Categories category) {
    switch (category) {
      case Categories.shirt:
        return 'Shirt';
      case Categories.pants:
        return 'Pants';
      case Categories.jacket:
        return 'Jacket';
      case Categories.hoodie:
        return 'Hoodie';
      case Categories.tshirt:
        return 'T-Shirt';
      case Categories.accessories:
        return 'Accessories';
    }
  }

  String _categoryImage(Categories category) {
    switch (category) {
      case Categories.shirt:
        return TImages.shirt_2;
      case Categories.pants:
        return TImages.pants_1;
      case Categories.jacket:
        return TImages.jacket_1;
      case Categories.hoodie:
        return TImages.hoodie_1;
      case Categories.tshirt:
        return TImages.tshirt_1;
      case Categories.accessories:
        return TImages.cap_1;
    }
  }
}