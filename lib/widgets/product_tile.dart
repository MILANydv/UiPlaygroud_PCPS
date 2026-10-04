import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_image.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product, required this.onTap});

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      leading: ProductImage(product: product, size: 56),
      title: Text(product.name),
      subtitle: Text('${product.category} - ${product.rating} stars'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: theme.textTheme.titleSmall,
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
