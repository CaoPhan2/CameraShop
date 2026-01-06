import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLoggedIn() async{
  final pref = await SharedPreferences.getInstance();
  return pref.getString("accessToken") != null;
}

Future<String?> getAvatar() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('avatar');
}
