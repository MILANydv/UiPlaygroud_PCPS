import 'package:flutter/material.dart';

import '../widgets/demo_section.dart';

class WidgetsGalleryScreen extends StatelessWidget {
  const WidgetsGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget gallery'),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DemoSection(
            title: 'Buttons',
            description: 'Five Material button families',
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton(onPressed: () {}, child: const Text('Filled')),
                FilledButton.tonal(
                  onPressed: () {},
                  child: const Text('Tonal'),
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
                TextButton(onPressed: () {}, child: const Text('Text')),
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
                IconButton(
                  onPressed: null,
                  icon: const Icon(Icons.lock),
                  tooltip: 'Disabled',
                ),
                const FloatingActionButton.small(
                  onPressed: null,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Containers',
            description: 'decoration, border, borderRadius, shape',
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text('radius'),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.secondaryContainer,
                  ),
                  child: const Text('circle'),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiaryContainer,
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: const Text('border'),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Clip and opacity',
            description: 'ClipRRect, ClipOval, Opacity',
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 90,
                    width: 90,
                    color: theme.colorScheme.primaryContainer,
                    alignment: Alignment.center,
                    child: const Text('ClipRRect'),
                  ),
                ),
                const SizedBox(width: 12),
                ClipOval(
                  child: Container(
                    height: 90,
                    width: 90,
                    color: theme.colorScheme.secondaryContainer,
                    alignment: Alignment.center,
                    child: const Text('Oval'),
                  ),
                ),
                const SizedBox(width: 12),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    height: 90,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('Opacity'),
                  ),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Avatars, badges and chips',
            description: 'CircleAvatar, Badge, Chip, ChoiceChip, InputChip',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(child: Text('AB')),
                    const SizedBox(width: 12),
                    CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: const Icon(Icons.person),
                    ),
                    const SizedBox(width: 12),
                    Badge.count(
                      count: 3,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_outlined),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(label: Text('Chip')),
                    ActionChip(label: Text('ActionChip')),
                    InputChip(label: Text('InputChip')),
                    ChoiceChip(label: Text('Selected'), selected: true),
                  ],
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Cards and list tiles',
            description: 'Card, Card + ListTile, Divider',
            child: Column(
              children: [
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.headphones),
                    title: Text('Leading icon'),
                    subtitle: Text('title, subtitle, trailing'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                const Divider(height: 24),
                Card(
                  color: theme.colorScheme.secondaryContainer,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Card with its own colour'),
                  ),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Text styles',
            description: 'headline, title, body, label, overline',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('headlineSmall', style: theme.textTheme.headlineSmall),
                Text('titleLarge', style: theme.textTheme.titleLarge),
                Text('titleMedium', style: theme.textTheme.titleMedium),
                Text('bodyLarge', style: theme.textTheme.bodyLarge),
                Text('bodyMedium', style: theme.textTheme.bodyMedium),
                Text('labelLarge', style: theme.textTheme.labelLarge),
                Text(
                  'LABEL SMALL',
                  style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 2),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Progress',
            description: 'Circular and linear, determinate or not',
            child: const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                LinearProgressIndicator(),
                SizedBox(height: 16),
                LinearProgressIndicator(value: 0.6),
              ],
            ),
          ),
          DemoSection(
            title: 'Expanded and Flexible',
            description:
                'Expanded takes all space, Flexible only what it needs',
            child: SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _Box(
                      label: 'Expanded flex 2',
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _Box(
                      label: 'flex 1',
                      color: theme.colorScheme.secondaryContainer,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: _Box(
                      label: 'Flexible',
                      color: theme.colorScheme.tertiaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
          DemoSection(
            title: 'Spacing and alignment',
            description: 'Padding, SizedBox, Align, Center, Spacer',
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: theme.colorScheme.surfaceContainerHighest,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Padding pushes content inward'),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      const Text('Spacer pushes'),
                      const Spacer(),
                      Text(
                        'this to the edge',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('alignment: Alignment.center'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}
