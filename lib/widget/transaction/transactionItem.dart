import 'package:flutter/material.dart';

class Transactionitem extends StatelessWidget {
  const Transactionitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10 ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1,color: Colors.grey.shade200))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                    image: DecorationImage(
                      image: AssetImage("assets/images/promo1.png"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Camera name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "\$3343",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 204, 252, 189)
                  ),
                  child: Text(
                    "Shipping",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 112, 211, 85),
                      fontSize: 12
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No. Order: L06567774NJH",
                    style: TextStyle(
                      fontSize: 13
                    ),
                  ),
                  Text(
                    "Qty: 1",
                    style: TextStyle(
                      fontSize: 13
                    ),
                  )
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFF6AC8FF)
                ),
                child: Text(
                  "View Tracking",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}