import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_icon.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
    this.useNetwork = false,
    this.size,
    this.borderRadius = 12,
  });

  final Product product;
  final bool useNetwork;
  final double? size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: useNetwork ? _network(context) : _asset(context),
    );
  }

  Widget _asset(BuildContext context) {
    return Image.asset(
      product.imageAsset,
      width: size,
      height: size,
      fit: BoxFit.cover,
      errorBuilder: _fallback,
    );
  }

  Widget _network(BuildContext context) {
    return Image.network(
      product.imageUrl,
      width: size,
      height: size,
      fit: BoxFit.cover,
      loadingBuilder: _loading,
      errorBuilder: _fallback,
    );
  }

  Widget _loading(
    BuildContext context,
    Widget child,
    ImageChunkEvent? progress,
  ) {
    if (progress == null) return child;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const CircularProgressIndicator(strokeWidth: 2),
    );
  }

  Widget _fallback(BuildContext context, Object error, StackTrace? stack) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: ProductIcon(product: product, size: 24),
    );
  }
}
