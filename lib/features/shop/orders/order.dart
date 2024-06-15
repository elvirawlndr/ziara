import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/shop/controllers/product_controller.dart';
import 'package:ziara/features/shop/orders/orders_list.dart';

class OrderScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Orders', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Obx(() {
        if (productController.orders.isEmpty) {
          return const Center(child: Text('No orders available'));
        }

        return ListView.builder(
          itemCount: productController.orders.length,
          itemBuilder: (context, index) {
            final order = productController.orders[index];
            return TOrderListItem(
              orderId: order.id,
              productImage: order.product.imageUrl,
              productName: order.product.name,
              status: order.status,
              dateTime: order.dateTime,
            );
          },
        );
      }),
    );
  }
}
