import 'dart:convert';
import 'package:camerashop/model/transaction/tracking.dart';
import 'package:http/http.dart' as http;
class trackingAPI{
  static const String Url = "https://692a49b17615a15ff24c503f.mockapi.io/Tracking";
  static Future<List<Tracking>> getTracking() async{
    final response = await http.get(Uri.parse(Url));
    if(response.statusCode == 200){
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item)=> Tracking.fromJson(item)).toList();
    }else{
      throw Exception("Failed to load transaction");
    }
  }
}