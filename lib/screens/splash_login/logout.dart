import 'package:camerashop/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

Future<void> logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.remove('accessToken');
  await prefs.remove('avatar');

  if (!context.mounted) return;
    

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => const HomeScreen()),
    (route) => false, 
  );
}
