import 'package:camerashop/widget/home/best_lens.dart';
import 'package:camerashop/widget/home/brands.dart';
import 'package:camerashop/widget/home/promo_on_going.dart';
import 'package:camerashop/widget/home/special_price.dart';
import 'package:camerashop/widget/other/appBar.dart';
import 'package:camerashop/widget/other/bottomAppBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String accessToken;
  const HomeScreen({super.key, required this.accessToken});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String keyword ="";
  void onSearch(String value){
    setState(() {
      keyword = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 156, 219, 255),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Appbar(onSearch: onSearch,),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, // từ trên
            end: Alignment.center, // xuống dưới
            colors: [
              Color(0xFF6AC8FF),// màu trên
              Colors.white,     // màu dưới
            ],
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            
            PromoOnGoing(),
            SizedBox(height: 20),
            Brands(),
            SpecialPrice(keyword: keyword,),
            SizedBox(height: 10),
            BestLens(keyword: keyword),
          ],
        ),
      ),
      bottomNavigationBar: Bottomappbar(currentIndex: 0, token: widget.accessToken),
    );
  }
}