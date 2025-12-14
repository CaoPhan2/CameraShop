import 'dart:convert';
import 'package:camerashop/model/transaction/tracking.dart';
import 'package:http/http.dart' as http;

class TrackingApi {
  static const String url =
      "https://692a49b17615a15ff24c503f.mockapi.io/Tracking";

  static Future<Tracking?> getTrackingByOrderId(String orderId) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);

      final item = jsonData.firstWhere(
        (e) => e['orderId'] == orderId,
        orElse: () => null,
      );

      if (item == null) return null;

      return Tracking.fromJson(item);
    } else {
      throw Exception("Failed to load tracking");
    }
  }
}
