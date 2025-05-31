import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ProductsScreen extends StatefulWidget {
  final String category;

  const ProductsScreen({super.key, required this.category});

  @override
  ProductsScreenState createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  List products = [];
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      var response = await Dio()
          .get('https://dummyjson.com/products/category/${widget.category}');
      setState(() {
        products = response.data['products'];
      });
    } catch (e) {
      log('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category} Products',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xffEF6494),
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(products[index]['thumbnail']),
                  title: Text(products[index]['title']),
                  subtitle: Text('\$${products[index]['price']}'),
                );
              },
            ),
    );
  }
}
