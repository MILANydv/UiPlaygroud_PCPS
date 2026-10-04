import 'package:flutter/material.dart';

import '../data/products.dart';
import '../models/product.dart';
import '../widgets/demo_section.dart';
import '../widgets/product_image.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Product product = kProducts.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DemoSection(
            title: 'Image.asset',
            description:
                'A file bundled in assets/images, described in pubspec',
            child: Column(
              children: [
                Row(
                  children: [
                    for (final Product item in kProducts.take(4))
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Image.asset(
                          item.imageAsset,
                          width: 64,
                          height: 64,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Image.network',
            description:
                'Loaded at runtime, with a spinner, a fallback and a circular crop',
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder:
                          (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? progress,
                          ) {
                            if (progress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            );
                          },
                      errorBuilder:
                          (BuildContext context, Object error, StackTrace? _) {
                            return Container(
                              alignment: Alignment.center,
                              color: theme.colorScheme.surfaceContainerHighest,
                              child: const Text('No network'),
                            );
                          },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ClipOval(
                  child: Image.network(
                    product.imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (BuildContext context, Object error, StackTrace? _) {
                          return Container(
                            width: 80,
                            height: 80,
                            color: theme.colorScheme.surfaceContainerHighest,
                            alignment: Alignment.center,
                            child: const Icon(Icons.person),
                          );
                        },
                  ),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Broken link',
            description: 'errorBuilder catches the failure and shows the icon',
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: Image.network(
                'https://example.invalid/missing.png',
                fit: BoxFit.cover,
                errorBuilder:
                    (BuildContext context, Object error, StackTrace? _) {
                      return Container(
                        alignment: Alignment.center,
                        color: theme.colorScheme.errorContainer,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.broken_image,
                              color: theme.colorScheme.onErrorContainer,
                            ),
                            Text(
                              'errorBuilder ran',
                              style: TextStyle(
                                color: theme.colorScheme.onErrorContainer,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
              ),
            ),
          ),
          DemoSection(
            title: 'The same product, both sources',
            description: 'ProductImage switches between asset and network',
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ProductImage(product: product, size: 100),
                      const SizedBox(height: 8),
                      const Text('useNetwork: false'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ProductImage(
                        product: product,
                        size: 100,
                        useNetwork: true,
                      ),
                      const SizedBox(height: 8),
                      const Text('useNetwork: true'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'BoxFit',
            description: 'cover, contain, fill, none on the same photo',
            child: Column(
              children: [
                for (final BoxFit fit in const [
                  BoxFit.cover,
                  BoxFit.contain,
                  BoxFit.fill,
                  BoxFit.none,
                ])
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/banner.png',
                              height: 60,
                              fit: fit,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 80,
                          child: Text(fit.name, textAlign: TextAlign.end),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          DemoSection(
            title: 'Shapes and decoration',
            description: 'ClipRRect, ClipOval and a Container image background',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Icon fallback',
            description: 'Every image can fall back to the category icon',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (final Product item in kProducts)
                  ProductImage(product: item, size: 56, borderRadius: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
