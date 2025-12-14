import 'package:camerashop/model/transaction/transaction.dart';
import 'package:camerashop/screens/transaction/shipment.dart';
import 'package:flutter/material.dart';

class Transactionitem extends StatelessWidget {
  Transaction transaction;
  Transactionitem({super.key, required this.transaction});

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
                      image: NetworkImage(transaction.productImage),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "\$${transaction.price}",
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
                    color: statusBgColor(transaction.status),
                  ),
                  child: Text(
                    transaction.status,
                    style: TextStyle(
                      color: statusTextColor(transaction.status),
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
                    "No. Order: ${transaction.orderId}",
                    style: TextStyle(
                      fontSize: 13
                    ),
                  ),
                  Text(
                    "Qty:${transaction.quantity}",
                    style: TextStyle(
                      fontSize: 13
                    ),
                  )
                ],
              ),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF6AC8FF),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 1,horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Shipment()));
                }, 
                child: Text(
                  "View Tracking",
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}

Color statusBgColor(String status) {
  switch (status.toLowerCase()) {
    case 'processing':
      return const Color(0xFFFFF3CD); // vàng nhạt
    case 'shipping':
      return const Color(0xFFE7F1FF); // xanh dương nhạt
    case 'completed':
      return const Color(0xFFE6F4EA); // xanh lá nhạt
    case 'cancelled':
      return const Color(0xFFFDECEA); // đỏ nhạt
    default:
      return Colors.grey.shade200;
  }
}

Color statusTextColor(String status) {
  switch (status.toLowerCase()) {
    case 'processing':
      return const Color(0xFFFF9800); // cam
    case 'shipping':
      return const Color(0xFF1A73E8); // xanh dương
    case 'completed':
      return const Color(0xFF34A853); // xanh lá
    case 'cancelled':
      return const Color(0xFFD93025); // đỏ
    default:
      return Colors.grey;
  }
}
