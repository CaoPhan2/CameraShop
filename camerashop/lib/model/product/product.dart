class Product {
  final int id;
  final String title;
  final double price;
  final String brand;
  final String category;
  final String description;
  final int stock;
  final int sold;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.category,
    required this.description,
    required this.stock,
    required this.sold,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num).toDouble(),
      brand: json["brand"],
      category: json["category"],
      description: json["description"],
      stock: json["stock"],
      sold: json["sold"],
      images: List<String>.from(json["images"]),
    );
  }
}
