part of "home.dart"; 
class TGridLayout extends StatelessWidget {

  const TGridLayout({super.key, required this.products});
  final List<Product> products;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: TSizes.gridViewSpacing,
                        crossAxisSpacing: TSizes.gridViewSpacing,
                        mainAxisExtent: 288,
                      ), 
                      itemCount: products.length,
                        itemBuilder: ((context, index) => TProductCardVertical(product: products[index]))
                    ),
                  );
  }
}