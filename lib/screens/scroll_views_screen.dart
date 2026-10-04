import 'package:flutter/material.dart';

import '../data/products.dart';
import '../models/product.dart';
import '../widgets/product_icon.dart';
import '../widgets/demo_section.dart';

class ScrollViewsScreen extends StatelessWidget {
  const ScrollViewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll views'),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DemoSection(
            title: 'SingleChildScrollView',
            description: 'One long column that scrolls as a whole',
            child: Column(
              children: [
                for (final Product product in kProducts.take(3))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(iconFor(product), size: 20),
                        const SizedBox(width: 12),
                        Expanded(child: Text(product.name)),
                      ],
                    ),
                  ),
                Container(
                  height: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Tall box, still scrolls'),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'ListView.separated',
            description: 'Dividers between items, built lazily',
            child: SizedBox(
              height: 160,
              child: ListView.separated(
                itemCount: kProducts.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 1),
                itemBuilder: (BuildContext context, int index) {
                  final Product product = kProducts[index];
                  return ListTile(
                    dense: true,
                    leading: Icon(iconFor(product)),
                    title: Text(product.name),
                    trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
          ),
          DemoSection(
            title: 'Horizontal ListView',
            description: 'Same widget, scrollDirection: Axis.horizontal',
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: kProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final Product product = kProducts[index];
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(iconFor(product), size: 32),
                  );
                },
              ),
            ),
          ),
          DemoSection(
            title: 'reverse: true',
            description: 'Starts at the bottom, useful for chat screens',
            child: SizedBox(
              height: 140,
              child: ListView.builder(
                reverse: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    leading: CircleAvatar(child: Text('${4 - index}')),
                    title: Text('Message ${4 - index}'),
                  );
                },
              ),
            ),
          ),
          DemoSection(
            title: 'Nested lists',
            description:
                'shrinkWrap + NeverScrollableScrollPhysics inside a scroll view',
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Outer scroll view', style: theme.textTheme.labelLarge),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: kProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Product product = kProducts[index];
                      return ListTile(dense: true, title: Text(product.name));
                    },
                  ),
                ],
              ),
            ),
          ),
          DemoSection(
            title: 'CustomScrollView',
            description: 'SliverAppBar that collapses, then a list and a grid',
            child: SizedBox(
              height: 420,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 120,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text('SliverAppBar'),
                      background: Container(
                        color: theme.colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'SliverToBoxAdapter puts one normal widget between '
                        'slivers.',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => ListTile(
                        leading: Icon(iconFor(kProducts[index])),
                        title: Text(kProducts[index].name),
                      ),
                      childCount: kProducts.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'SliverGrid below',
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('${index + 1}'),
                      ),
                      childCount: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
