import 'dart:convert';

import 'package:camerashop/model/brand/brand.dart';
import 'package:http/http.dart' as http;
class Brandapi {
  static const String Url = "https://691f18b1bb52a1db22c0732c.mockapi.io/Brand";
  static Future<List<Brand>> getBrands() async{
    final response = await http.get(Uri.parse(Url));
    if(response.statusCode == 200){
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Brand.fromJson(item)).toList();
    }else{
      throw Exception("Failed to load brands");
    }
  }
}