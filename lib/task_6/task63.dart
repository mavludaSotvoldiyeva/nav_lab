import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Product {
  final String name;
  final double price;
  const Product(this.name, this.price);
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductListScreen(),
    ),
    GoRoute(
      path: '/product-details',
      builder: (context, state) {
        final product = state.extra as Product;
        return ProductScreen(product: product);
      },
    ),
  ],
);

void main() => runApp(MaterialApp.router(routerConfig: router));

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const products = [
      Product('Laptop', 999.0),
      Product('Phone', 599.5),
      Product('Headphones', 79.9),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Task 6.3')),
      body: ListView(
        children: products.map((product) {
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            onTap: () {
              context.push('/product-details', extra: product);
            },
          );
        }).toList(),
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Text(
          'Price: \$${product.price}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}