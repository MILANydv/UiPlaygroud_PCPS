import 'package:flutter/material.dart';

import '../widgets/section_header.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout playground'),
        automaticallyImplyLeading: true,
        backgroundColor: theme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(
            title: 'Row and Column',
            subtitle: 'The two building blocks of every layout',
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Column child 1'),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Column child 2'),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('flex: 2'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('flex: 1'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SectionHeader(
            title: 'Flexible and Spacer',
            subtitle: 'Share the free space',
          ),
          const SizedBox(height: 12),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Flexible(
                  child: Text('Flexible shrinks: ${'long text here' * 3}'),
                ),
                const Spacer(),
                const Icon(Icons.favorite),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SectionHeader(
            title: 'Wrap',
            subtitle: 'Chips flow to the next line when they run out of room',
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final String category in const [
                'Audio',
                'Accessories',
                'Wearables',
                'Home',
                'Bags',
              ])
                Chip(label: Text(category)),
            ],
          ),
          const SizedBox(height: 24),
          const SectionHeader(
            title: 'Stack',
            subtitle: 'Widgets painted on top of each other',
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 140,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text('Positioned'),
                  ),
                ),
                const Center(child: Text('Centered')),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SectionHeader(
            title: 'Buttons',
            subtitle: 'Filled, outlined, text and icon buttons',
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              TextButton(onPressed: () {}, child: const Text('Text')),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
              ),
              const FloatingActionButton.small(
                onPressed: null,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
