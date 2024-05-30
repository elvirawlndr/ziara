part of "product_card_vertical.dart"; 
class TCircularIcon extends StatelessWidget {
  const TCircularIcon({super.key, this.width, this.height, this.size = TSizes.lg, required this.icon, this.color, this.backgroundColor, this.onPressed});

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: dark ? TColors.black.withOpacity(0.9) : TColors.lightBase.withOpacity(0.9),
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(icon, color: color, size: size)),
                );
  }
}