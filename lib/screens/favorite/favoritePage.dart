import 'package:camerashop/widget/favorite/myFavorCam.dart';
import 'package:camerashop/widget/favorite/myWhisLen.dart';
import 'package:camerashop/widget/other/appBar.dart';
import 'package:camerashop/widget/other/bottomAppBar.dart';
import 'package:flutter/material.dart';

class Favoritepage extends StatefulWidget {
  const Favoritepage({super.key});

  @override
  State<Favoritepage> createState() => _FavoritepageState();
}

class _FavoritepageState extends State<Favoritepage> {
  String keyword ="";
  void onSearch(String value){
    setState(() {
      keyword = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,   // cho gradient chạy lên dưới AppBar
      backgroundColor: Colors.white,
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
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 120),
          scrollDirection: Axis.vertical,
          children: [
            Row(
              children: [
                Text(
                  "Your Favorite",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),
                Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 14
                  ),
                )
              ],
            ),
            Divider(color: const Color.fromARGB(255, 202, 238, 255),),
            SizedBox(height: 10,),
            Myfavorcam(),
            SizedBox(height: 10,),
            Mywhislen(),
          ],
        ),
      ),
      bottomNavigationBar: Bottomappbar(currentIndex: 1,),
    );
  }
}