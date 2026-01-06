import 'package:camerashop/widget/home/promoSlide.dart';
import 'package:flutter/material.dart';

class PromoOnGoing extends StatefulWidget {
  const PromoOnGoing({super.key});

  @override
  State<PromoOnGoing> createState() => _PromoOnGoingState();
}

class _PromoOnGoingState extends State<PromoOnGoing> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Promo on Going",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "23 : 59 : 59",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        Promoslider(),
      ],
    );
  }
}