import 'package:camerashop/model/product/product.dart';
import 'package:flutter/material.dart';

class Receiptitem extends StatelessWidget {
  final Product product;
  final int quantity;
  const Receiptitem({super.key, required this.product,required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(product.images[0]),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "Quantity : $quantity",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500]
                ),
              )
            ],
          ),
          Spacer(),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}