import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_image.dart';
import '../widgets/section_header.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        automaticallyImplyLeading: true,
        backgroundColor: theme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Hero(
            tag: product.id,
            child: ProductImage(product: product, size: 220, borderRadius: 20),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 140,
            width: double.infinity,
            child: ProductImage(
              product: product,
              useNetwork: true,
              borderRadius: 20,
            ),
          ),
          const SizedBox(height: 16),
          SectionHeader(
            title: product.name,
            subtitle: product.category,
            trailing: Chip(label: Text('${product.rating} stars')),
          ),
          const SizedBox(height: 16),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(product.description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () => _showMessage(context, 'Added to cart'),
                  child: const Text('Add to cart'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _showMessage(context, 'Checkout is next'),
                  child: const Text('Buy now'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
