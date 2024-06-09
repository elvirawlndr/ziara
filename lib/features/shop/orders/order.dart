import 'package:flutter/material.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/shop/orders/orders_list.dart';
import 'package:ziara/utils/const/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineMedium,),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TOrderListItem(),
        ),
    );
  }
}