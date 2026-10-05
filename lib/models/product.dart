class Product {
  const Product({
    required this.id,

    required this.name,
    this.category,
    required this.price,
    required this.rating,
    required this.iconName,
    required this.description,
    required this.imageAsset,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String? category;
  final double price;
  final double rating;
  final String iconName;
  final String description;
  final String imageAsset;
  final String imageUrl;
}
