import 'dart:async';

import 'package:flutter/material.dart';

class Promoslider extends StatefulWidget {
  const Promoslider({super.key});

  @override
  State<Promoslider> createState() => _PromosliderState();
}
  

class _PromosliderState extends State<Promoslider> {
  final List<Widget> promoSlides = [
      promoSlide2(),
      promoSlide1(),
      promoSlide3(),
  ];

  final PageController _controller =    PageController(initialPage: 1000);
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 10), (timer) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: _controller,
        itemBuilder: (context, index) {
          final realIndex = index % promoSlides.length;
          return promoSlides[realIndex];
        },
      ),
    );
  }
}

Widget promoSlide2() {
  return Stack(     
    children: [
      Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/promo1.jpg"),
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        left: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Get the special discount\nfor your first purchase",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6AC8FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Shop Now",
                style: TextStyle(
                  color: Colors.grey[100],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget promoSlide1() {
  return Stack(
    children: [
      // Background
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("https://mcard.id/backend/img/vCards/IMG-header-canon-banner.jpg"),
          ),
        ),
      ),
      Positioned(
        left: 20,
        top: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "NEW ARRIVAL",
              style: TextStyle(
                color: Colors.white70,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Canon EOS\n2025 Series",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6AC8FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Explore", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    ],
  );
}




Widget promoSlide3() {
  return Stack(
    children: [

      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage("assets/images/promo2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),

      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.4),
        ),
      ),

      // Sale badge
      Positioned(
        top: 15,
        right: 15,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "UP TO 30% OFF",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),

      // Content
      Positioned(
        left: 20,
        bottom: 25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LIMITED TIME",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Big Camera Sale",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Buy Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

