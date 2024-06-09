part of "../../features/shop/screens/home/home.dart";

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
    this.onSubmitted,
  });

  final String text;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final bool showBackground, showBorder;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final TextEditingController _controller = TextEditingController();

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          decoration: BoxDecoration(
            color: showBackground ? (dark ? TColors.darkBase : TColors.lightBase) : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  onSubmitted: onSubmitted,
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    prefixIcon: const Icon(Icons.search, color: TColors.darkergrey),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: showBackground ? (dark ? TColors.darkBase : TColors.lightBase) : Colors.transparent,
                    contentPadding: const EdgeInsets.all(TSizes.sm),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
