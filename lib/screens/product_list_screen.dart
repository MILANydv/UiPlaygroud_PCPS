import 'package:flutter/material.dart';

import '../data/products.dart';
import '../models/product.dart';
import '../widgets/product_tile.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List view'),
        automaticallyImplyLeading: true,
        backgroundColor: theme.primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: kProducts.length,
        itemBuilder: (BuildContext context, int index) {
          final Product product = kProducts[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ProductTile(
              product: product,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      ProductDetailScreen(product: product),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
