import 'package:camerashop/model/Cart/Cart.dart';
import 'package:camerashop/widget/checkout_payment/receiptItem.dart';
import 'package:flutter/material.dart';
class Receiptpage extends StatefulWidget {
  final double total;
  const Receiptpage({super.key, required this.total});

  @override
  State<Receiptpage> createState() => _ReceiptpageState();
}

class _ReceiptpageState extends State<Receiptpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Purchase Receipt",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 215, 255, 215) 
                ),
                child: Icon(Icons.check_circle, size: 25, color: Colors.green,)
              ),
              SizedBox(height: 10,),
              Text(
                "\$${(widget.total - 10).toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),

              ),
              SizedBox(height: 5,),
              Text(
                "Payment Success!",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14
                ),
              )
            ],
          ),
          Divider(),
          SizedBox(height: 10,),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "No.Card",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Text(
                    "34645635757477"
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Date Payment",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Text(
                    "28-07-2025, 09:41:13"
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Mobile Banking"
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Sender Name",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Cameron Williamson"
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          for(var item in Cart().items)
            Receiptitem(product: item.product, quantity: item.Quantity,),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Shipping Option",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Fedx"
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Text(
                    "32/131 Tran Phu, Tp Hue"
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Total item (${Cart().items.length})",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$${(widget.total -10).toStringAsFixed(2)}"
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Shipping Fee",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$10"
                  )
                ],
              )
            ],
          ),

        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shadowColor: Color(0xFF6AC8FF),
        elevation: 2,
        child: Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18,horizontal: 65),
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF6AC8FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Color(0xFF6AC8FF))
                )
              ),
              onPressed: (){}, 
              child: Text(
                "Download Receipt",
               
              )
            ),

            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18,horizontal: 65),
                backgroundColor: Color(0xFF6AC8FF),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Color(0xFF6AC8FF))
                )
              ),
              onPressed: (){
                Navigator.pushNamed(context, "/");
              }, 
              child: Text(
                "Back Home"
              )
            )
          ],
        ),
      ),
    );
  }
}