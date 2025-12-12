import 'dart:convert';

import 'package:camerashop/model/transaction/transaction.dart';
import 'package:http/http.dart' as http;
class transactionAPI{
  static const String Url = "https://6929c4099d311cddf34b2ff6.mockapi.io/Transactions";
  static Future<List<Transaction>> getTransaction() async{
    final response = await http.get(Uri.parse(Url));
    if(response.statusCode == 200){
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item)=> Transaction.fromJson(item)).toList();
    }else{
      throw Exception("Failed to load transaction");
    }
  }
}