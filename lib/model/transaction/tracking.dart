import 'package:camerashop/model/transaction/trackingtimeline.dart';

class Tracking {
  final String trackingNumber;
  final String orderId;
  final String customerName;
  final String shippingService;
  final String deliveryDate;
  final String status;
  final List<TrackingTimeline> timeline;

  Tracking({
    required this.trackingNumber,
    required this.orderId,
    required this.customerName,
    required this.shippingService,
    required this.deliveryDate,
    required this.status,
    required this.timeline,
  });

  factory Tracking.fromJson(Map<String, dynamic> json) {
    return Tracking(
      trackingNumber: json['trackingNumber'],
      orderId: json['orderId'],
      customerName: json['customerName'],
      shippingService: json['shippingService'],
      deliveryDate: json['deliveryDate'],
      status: json['status'],
      timeline: (json['timeline'] as List)
          .map((e) => TrackingTimeline.fromJson(e))
          .toList(),
    );
  }
}
