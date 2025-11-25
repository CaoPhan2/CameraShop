class Brand {
  final String id;
  final String title;
  final String image;

  Brand({
    required this.id,
    required this.title,
    required this.image,
  });

  // Hàm tạo từ JSON
  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }

  // Hàm chuyển sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }
}
