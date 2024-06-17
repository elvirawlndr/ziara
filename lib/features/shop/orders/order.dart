import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/features/shop/controllers/product_controller.dart';
import 'package:ziara/features/shop/models/order_model.dart';
import 'package:ziara/features/shop/orders/orders_list.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final ProductController productController = Get.put(ProductController());
  bool _sortAscending = false; // Flag to toggle ascending/descending order

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Orders', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              setState(() {
                _sortAscending = !_sortAscending;
              });
            },
          ),
        ],
      ),
      body: Obx(() {
        if (productController.orders.isEmpty) {
          return const Center(child: Text('No orders available'));
        }

        // Sort orders based on dateTime
        List<OrderModel> sortedOrders = List.from(productController.orders);
        sortedOrders.sort((a, b) {
          if (_sortAscending) {
            return a.dateTime.compareTo(b.dateTime); // Ascending order
          } else {
            return b.dateTime.compareTo(a.dateTime); // Descending order (latest first)
          }
        });

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: sortedOrders.length,
          itemBuilder: (context, index) {
            final order = sortedOrders[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjust as needed
              child: TOrderListItem(
                orderId: order.id,
                productImage: order.product.imageUrl,
                productName: order.product.name,
                status: order.status,
                dateTime: order.dateTime,
              ),
            );
          },
        );
      }),
    );
  }
}
