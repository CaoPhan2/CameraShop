class Transaction {
  final String transactionId;
  final String orderId;
  final String productName;
  final String productImage;
  final int quantity;
  final int price;
  final String status;
  final String shopName;
  final bool trackingAvailable;
  final String? trackingNumber;
  final String createdDate;

  Transaction({
    required this.transactionId,
    required this.orderId,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.price,
    required this.status,
    required this.shopName,
    required this.trackingAvailable,
    this.trackingNumber,
    required this.createdDate,
  });

 
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transactionId'],
      orderId: json['orderId'],
      productName: json['productName'],
      productImage: json['productImage'],
      quantity: json['quantity'],
      price: json['price'],
      status: json['status'],
      shopName: json['shopName'],
      trackingAvailable: json['trackingAvailable'],
      trackingNumber: json['trackingNumber'],
      createdDate: json['createdDate'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'transactionId': transactionId,
      'orderId': orderId,
      'productName': productName,
      'productImage': productImage,
      'quantity': quantity,
      'price': price,
      'status': status,
      'shopName': shopName,
      'trackingAvailable': trackingAvailable,
      'trackingNumber': trackingNumber,
      'createdDate': createdDate,
    };
  }
}
