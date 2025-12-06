import 'dart:convert';

import 'package:camerashop/model/rate/rate.dart';
import 'package:http/http.dart' as http;
class RateAPI {
  static const String Url = "https://692a49b17615a15ff24c503f.mockapi.io/Rate";
  static Future<List<Rate>> getRates() async{
    final response = await http.get(Uri.parse(Url));
    if(response.statusCode == 200){
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item)=> Rate.fromJson(item)).toList();
    }else{
      throw Exception("Failed to load products");
    }
  }
}
