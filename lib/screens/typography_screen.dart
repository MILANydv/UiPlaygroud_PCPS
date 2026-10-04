import 'package:flutter/material.dart';

import '../widgets/demo_section.dart';

void _noop() {}

const List<IconData> kIcons = <IconData>[
  Icons.home,
  Icons.search,
  Icons.favorite,
  Icons.shopping_cart,
  Icons.person,
  Icons.settings,
  Icons.notifications,
  Icons.star,
  Icons.mail,
  Icons.lock,
  Icons.phone,
  Icons.location_on,
  Icons.calendar_today,
  Icons.camera,
  Icons.download,
  Icons.share,
  Icons.delete,
  Icons.edit,
  Icons.check_circle,
];

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fonts and icons'),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DemoSection(
            title: 'Font families',
            description: 'The whole app uses the Poppins family from pubspec',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Poppins (app default)',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'System font',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontFamily: null,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Monospace',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontFamily: 'monospace',
                    fontFamilyFallback: const ['Roboto'],
                  ),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Font weights',
            description: 'One family, four weights declared in pubspec.yaml',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Poppins 400',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  'Poppins 500',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Poppins 600',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Poppins 700',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Font size and style',
            description: 'fontSize, fontStyle, height and letterSpacing',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Size 12', style: TextStyle(fontSize: 12)),
                Text('Size 18', style: TextStyle(fontSize: 18)),
                Text('Size 26', style: TextStyle(fontSize: 26)),
                Text(
                  'Italic',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                Text(
                  'Tight line height',
                  style: TextStyle(fontSize: 18, height: 1),
                ),
                Text(
                  'Spaced out',
                  style: TextStyle(fontSize: 14, letterSpacing: 4),
                ),
                Text(
                  'Word spaced',
                  style: TextStyle(fontSize: 14, wordSpacing: 6),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Text overflow',
            description: 'maxLines, overflow and softWrap',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'This sentence is clipped after one line and ends with three '
                  'dots instead of wrapping onto the next row.',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  'This sentence is faded away at the end when it cannot show '
                  'every line of the paragraph inside the card.',
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Icons',
            description: 'Material icons are a font shipped with Flutter',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    Icon(Icons.home),
                    Icon(Icons.search),
                    Icon(Icons.shopping_cart),
                    Icon(Icons.favorite),
                    Icon(Icons.star),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (final IconData icon in kIcons.take(5))
                      Icon(icon, size: 32, color: theme.colorScheme.primary),
                  ],
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Icon sizes and colours',
            description: 'size, color and IconTheme for a whole subtree',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.favorite, size: 16),
                    Icon(Icons.favorite, size: 24),
                    Icon(Icons.favorite, size: 32),
                    Icon(Icons.favorite, size: 48),
                  ],
                ),
                const SizedBox(height: 16),
                IconTheme(
                  data: IconThemeData(
                    color: theme.colorScheme.tertiary,
                    size: 28,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.mail),
                      Icon(Icons.lock),
                      Icon(Icons.camera),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DemoSection(
            title: 'Icons inside widgets',
            description: 'ListTile, Card, Chip and buttons take icons too',
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.mail_outline),
                  title: Text('ListTile leading icon'),
                  trailing: Icon(Icons.chevron_right),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.delete_outline),
                    title: const Text('Delete'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: const [
                    Chip(
                      avatar: Icon(Icons.star, size: 18),
                      label: Text('Chip with avatar'),
                    ),
                    ActionChip(
                      avatar: Icon(Icons.add, size: 18),
                      label: Text('ActionChip'),
                      onPressed: _noop,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
