import 'package:flutter/material.dart';

import '../models/product.dart';

const Map<String, IconData> kCategoryIcons = <String, IconData>{
  'Audio': Icons.headphones,
  'Accessories': Icons.keyboard,
  'Wearables': Icons.watch,
  'Home': Icons.lightbulb_outline,
  'Bags': Icons.backpack,
};

IconData iconFor(Product product) =>
    kCategoryIcons[product.category] ?? Icons.shopping_bag;

class ProductIcon extends StatelessWidget {
  const ProductIcon({super.key, required this.product, this.size = 48});

  final Product product;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(iconFor(product), size: size);
  }
}
