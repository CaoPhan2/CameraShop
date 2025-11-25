import 'package:camerashop/screens/favorite/favoritePage.dart';
import 'package:camerashop/screens/home/home_screen.dart';
import 'package:camerashop/screens/profile/profilePage.dart';
import 'package:camerashop/screens/transaction/transactionsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes:{
      "/": (context)=> HomeScreen(),
      "/favoritePage": (context) => Favoritepage(),
      "/profilePage": (context)=> Profilepage(),
      // "/scanPage": (context)=> Scanpage(),
      "/transactionsPage":(context)=>Transactionspage(),
    },
    );
  }
}