import 'package:flutter/material.dart';

import '../data/products.dart';
import 'images_screen.dart';
import 'layout_screen.dart';
import 'login_screen.dart';
import 'onboarding_screen.dart';
import 'product_detail_screen.dart';
import 'product_grid_screen.dart';
import 'product_list_screen.dart';
import 'scroll_views_screen.dart';
import 'typography_screen.dart';
import 'widgets_gallery_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Playground'),
        automaticallyImplyLeading: false,
        backgroundColor: theme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Shop UI', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text(
            'Static screens built only with widgets. No state, no storage.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          _DemoTile(
            icon: Icons.view_list,
            title: 'List view',
            subtitle: 'ListView.builder + ListTile',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ProductListScreen(),
              ),
            ),
          ),
          _DemoTile(
            icon: Icons.grid_view,
            title: 'Grid view',
            subtitle: 'GridView.builder + SliverGridDelegate',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ProductGridScreen(),
              ),
            ),
          ),
          _DemoTile(
            icon: Icons.open_in_full,
            title: 'Product detail',
            subtitle: 'Expanded, Flexible, Container',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    ProductDetailScreen(product: kProducts.first),
              ),
            ),
          ),
          _DemoTile(
            icon: Icons.dashboard_customize,
            title: 'Layout playground',
            subtitle: 'Row, Column, Wrap, Stack, Spacer',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const LayoutScreen(),
              ),
            ),
          ),
          _DemoTile(
            icon: Icons.widgets,
            title: 'Widget gallery',
            subtitle: 'Buttons, containers, chips, text styles',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const WidgetsGalleryScreen(),
              ),
            ),
          ),
          _DemoTile(
            icon: Icons.swap_vert,
            title: 'Scroll views',
            subtitle: 'SingleChildScrollView, CustomScrollView, slivers',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ScrollViewsScreen(),
              ),
            ),
          ),
          _DemoTile(
            icon: Icons.image_outlined,
            title: 'Images',
            subtitle: 'Image.asset, Image.network, BoxFit, clip and fallback',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ImagesScreen(),
              ),
            ),
          ),
          _DemoTile(
            icon: Icons.text_fields,
            title: 'Fonts and icons',
            subtitle: 'Poppins weights, letter spacing, Material icons',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const TypographyScreen(),
              ),
            ),
          ),
          _DemoTile(
            icon: Icons.view_carousel_outlined,
            title: 'Onboarding',
            subtitle: 'PageView with a page indicator',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const OnboardingScreen(),
              ),
            ),
          ),
          _DemoTile(
            icon: Icons.login,
            title: 'Login',
            subtitle: 'TextField decorations and a sticky layout',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const LoginScreen(),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Every screen here is a StatelessWidget reading a constant '
                    'list, so what you see is what the code says.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoTile extends StatelessWidget {
  const _DemoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(child: Icon(icon)),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.arrow_forward, color: theme.colorScheme.primary),
        ),
      ),
    );
  }
}
