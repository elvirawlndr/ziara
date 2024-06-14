import 'package:flutter/material.dart';
import 'package:ziara/data/models/product.dart';

class SearchPage extends StatefulWidget {
  final List<Product> products;

  const SearchPage({super.key, required this.products});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Product> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void _filterProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredProducts = widget.products;
      });
    } else {
      setState(() {
        filteredProducts = widget.products.where((product) {
          return product.title.toLowerCase().contains(query.toLowerCase()) ||
                 product.brand.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (query) {
                _filterProducts(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ListTile(
                  leading: Image.asset(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.brand),
                  trailing: Text(product.price),
                  onTap: () {
                    // Handle product tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
