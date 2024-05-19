part of "../../features/shop/screens/home/home.dart"; 
class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return TVerticalImageText(title: 'Shirt', image: TImages.shirtIcon, onTap: (){});
                            }
                          ),
                        );
  }
}