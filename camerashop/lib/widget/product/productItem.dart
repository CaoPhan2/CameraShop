import 'package:camerashop/model/Cart/Cart.dart';
import 'package:camerashop/model/product/product.dart';
import 'package:camerashop/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';

class Productitem extends StatefulWidget {
  final Product product;
  const Productitem({super.key, required this.product});

  @override
  State<Productitem> createState() => _ProductitemState();
}

class _ProductitemState extends State<Productitem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(product: widget.product,),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 15, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.product.images[0]),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.product.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon( 
                  Icons.star, 
                  color: Colors.amber, 
                  size: 16 
                ),
                Text("(36)"),
                SizedBox(width: 10),
                Text(widget.product.sold.toString()+ " sold"),
                  
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "\$${widget.product.price}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "\$${widget.product.price-15.2}",  // tạm thời 
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Cart().addToCart(widget.product); // thêm sản phẩm vào giỏ
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: 
                  Row(
                    children: [
                      Icon(Icons.done,size: 18,color: Colors.green,),
                      Text(' Đã thêm vào giỏ hàng',style: TextStyle(color: Colors.green),), 
                    ],
                  ),
                  backgroundColor: Colors.white,
                  duration: Duration(seconds: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6AC8FF),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 65, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}