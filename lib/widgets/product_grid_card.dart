import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_image.dart';

class ProductGridCard extends StatelessWidget {
  const ProductGridCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ProductImage(product: product, borderRadius: 0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      const Icon(Icons.star, size: 16),
                      const SizedBox(width: 2),
                      Text('${product.rating}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
