import '../models/product.dart';

const List<Product> kProducts = <Product>[
  Product(
    id: 'p1',
    imageAsset: 'assets/images/headphones.png',
    imageUrl: 'https://picsum.photos/seed/aurora-headphones/400/400',
    name: 'Aurora Headphones',
    category: 'Audio',
    price: 129.99,
    rating: 4.6,
    iconName: 'headphones',
    description:
        'Wireless over-ear headphones with 30 hour battery life and active noise cancelling.',
  ),
  Product(
    id: 'p2',
    imageAsset: 'assets/images/keyboard.png',
    imageUrl: 'https://picsum.photos/seed/nimbus-keyboard/400/400',
    name: 'Nimbus Keyboard',
    category: 'Accessories',
    price: 89.50,
    rating: 4.3,
    iconName: 'keyboard',
    description:
        'Mechanical keyboard with hot swappable switches and a aluminium frame.',
  ),
  Product(
    id: 'p3',
    imageAsset: 'assets/images/watch.png',
    imageUrl: 'https://picsum.photos/seed/pulse-smartwatch/400/400',
    name: 'Pulse Smartwatch',
    category: 'Wearables',
    price: 199.00,
    rating: 4.8,
    iconName: 'watch',
    description:
        'Fitness watch with heart rate, sleep tracking and a seven day battery.',
  ),
  Product(
    id: 'p4',
    imageAsset: 'assets/images/mouse.png',
    imageUrl: 'https://picsum.photos/seed/vertex-mouse/400/400',
    name: 'Vertex Mouse',
    category: 'Accessories',
    price: 45.75,
    rating: 4.1,
    iconName: 'mouse',
    description: 'Lightweight wireless mouse with an 8000 DPI sensor.',
  ),
  Product(
    id: 'p5',
    imageAsset: 'assets/images/lamp.png',
    imageUrl: 'https://picsum.photos/seed/lumen-desk-lamp/400/400',
    name: 'Lumen Desk Lamp',
    category: 'Home',
    price: 34.90,
    rating: 4.4,
    iconName: 'lamp',
    description:
        'Adjustable desk lamp with three colour temperatures and a USB port.',
  ),
  Product(
    id: 'p6',
    imageAsset: 'assets/images/backpack.png',
    imageUrl: 'https://picsum.photos/seed/cobalt-backpack/400/400',
    name: 'Cobalt Backpack',
    category: 'Bags',
    price: 74.25,
    rating: 4.7,
    iconName: 'backpack',
    description:
        'Water resistant backpack with a padded 15 inch laptop sleeve.',
  ),
];

const List<String> kCategories = <String>[
  'All',
  'Audio',
  'Accessories',
  'Wearables',
  'Home',
  'Bags',
];
