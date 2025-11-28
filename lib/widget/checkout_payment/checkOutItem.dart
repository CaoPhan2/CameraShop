import 'package:flutter/material.dart';

class Checkoutitem extends StatelessWidget {
  const Checkoutitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300))
      ),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("assets/images/promo1.jpg"),
              )
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Camera anme",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "\$35454",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "Quantity : 1",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500]
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}