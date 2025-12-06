import 'dart:convert';

import 'package:camerashop/model/profile/profile.dart';
import 'package:http/http.dart' as http;
class UserAPI {
  static const String Url = "https://6929c4099d311cddf34b2ff6.mockapi.io/Users";
  static Future<List<User>> getUsers() async{
    final response = await http.get(Uri.parse(Url));
    if(response.statusCode == 200){
      List jsonData = jsonDecode(response.body);
      return jsonData.map((item)=>User.fromJson(item)).toList();
    }else{
      throw Exception("Failed to load profile");
    }
  }
}
