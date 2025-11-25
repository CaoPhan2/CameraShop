
import 'dart:convert';

import 'package:camerashop/model/product/product.dart';
import 'package:http/http.dart' as http;

class Productapi {
  static const String Url = "https://691f18b1bb52a1db22c0732c.mockapi.io/Product";
  static Future<List<Product>> getProducts() async{
    final response = await http.get(Uri.parse(Url));
    if(response.statusCode == 200){
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item)=> Product.fromJson(item)).toList();
    }else{
      throw Exception("Failed to load products");
    }
  }
}