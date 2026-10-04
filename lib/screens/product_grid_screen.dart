import 'package:flutter/material.dart';

import '../data/products.dart';
import '../models/product.dart';
import '../widgets/product_grid_card.dart';
import 'product_detail_screen.dart';

class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid view'),
        automaticallyImplyLeading: true,
        backgroundColor: theme.primaryColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisExtent: 230,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: kProducts.length,
        itemBuilder: (BuildContext context, int index) {
          final Product product = kProducts[index];

          return ProductGridCard(
            product: product,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    ProductDetailScreen(product: product),
              ),
            ),
          );
        },
      ),
    );
  }
}
