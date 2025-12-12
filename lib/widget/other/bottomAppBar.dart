import 'package:camerashop/screens/favorite/favoritePage.dart';
import 'package:camerashop/screens/home/home_screen.dart';
import 'package:camerashop/screens/profile/profilePage.dart';
import 'package:camerashop/screens/transaction/transactionsPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class Bottomappbar extends StatelessWidget {
  final int currentIndex; 
  final String token;
  const Bottomappbar({super.key, required this.currentIndex, required this.token});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      height: 60,
      elevation: 1,
      style: TabStyle.fixed,
      backgroundColor: Colors.white,
      color: Colors.grey,
      activeColor: Color(0xFF6AC8FF),
      initialActiveIndex: currentIndex,
      items: [
        TabItem(icon: Icons.home_outlined, title: 'Home'),
        TabItem(icon: Icons.favorite_outline, title: 'Favorite'),
        TabItem(
          icon: Container( 
            decoration: BoxDecoration(
              color: Color(0xFF6AC8FF),
              shape: BoxShape.circle,      
                  
            ),
            child: Icon(Icons.qr_code_scanner_outlined,color: Colors.white,)
          ), 
          title: 'Scan'
        ),
        TabItem(icon: Icons.receipt_long, title: 'Transactions'),
        TabItem(icon: Icons.person_outline, title: 'Profile'),
      ],
      onTap: (int i) {
        if(i==0){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(accessToken: token),
            ),
          );
        }
        
        if(i==1){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Favoritepage(accessToken: token),
            ),
          );
        }
        if(i==2){
          Navigator.pushNamed(context, "/scanPage");
        }
        if(i==3){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Transactionspage(accessToken: token),
            ),
          );
        }
        if(i==4){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profilepage(accessToken: token),
            ),
          );
        }
      },
    );
  }
}