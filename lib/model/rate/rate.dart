class Rate {
  final String rateId;
  final String userId;
  final String productId;
  final int rating;
  final String comment;
  final List<String> images;
  final DateTime createdAt;

  Rate({
    required this.rateId,
    required this.userId,
    required this.productId,
    required this.rating,
    required this.comment,
    required this.images,
    required this.createdAt

  }) ;
  
  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      rateId: json['rateId'],
      userId: json['userId'],
      productId: json['productId'],
      rating: json['rating'],
      comment: json['comment'],
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  
}