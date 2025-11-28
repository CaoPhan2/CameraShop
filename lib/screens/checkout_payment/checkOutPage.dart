import 'package:camerashop/widget/checkout_payment/checkOutItem.dart';
import 'package:flutter/material.dart';

class Checkoutpage extends StatefulWidget {
  const Checkoutpage({super.key});

  @override
  State<Checkoutpage> createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  bool _ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Checkout",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_horiz)
            )
          ],
        )
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          for(int i=0;i<3;i++)
          Checkoutitem(),
          SizedBox(height: 20,),
          Text(
            "Order Information",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 235, 255, 210)
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle,size: 16, color: Colors.green,),
                SizedBox(width: 10,),
                Text(
                  "Congratulations! We have sent your order details to our cashier.",
                  style: TextStyle(
                    color: Colors.green
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Full Name",
            style: TextStyle(
              color: Colors.grey[500]
            ),
          ),
          SizedBox(height:10,),
          Text(
            "Cameron Williamson",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(
                    "Enail address",
                    style: TextStyle(
                      color: Colors.grey[500]
                    ),
                  ),
                  SizedBox(height:10,),
                  Text(
                    "Caophan2106@gmail.com",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(
                    "Numb Phone",
                    style: TextStyle(
                      color: Colors.grey[500]
                    ),
                  ),
                  SizedBox(height:10,),
                  Text(
                    "0705236974",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          Text(
            "Choose Payment Method",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height:10,),
          Text(
            "Please select your payment method",
            style: TextStyle(
              color: Colors.grey[500]
              
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Credit Card/Debit"
                    ),
                    Spacer(),
                    Icon(Icons.credit_card,color: Colors.blue,size: 16,),
                    SizedBox(width: 10,),
                    Icon(Icons.credit_score_outlined, color: Colors.orange,size: 16,),
                    SizedBox(width: 10,),
                    Checkbox(
                      value: _ischecked, 
                      onChanged: (value){
                        setState(() {
                          _ischecked = value!;
                        });
                      },
                      activeColor: Color(0xFF6AC8FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      "Mobile Banking"
                    ),
                    Spacer(),
                    Icon(Icons.credit_card,color: Colors.blue,size: 16,),
                    SizedBox(width: 10,),
                    Icon(Icons.credit_score_outlined, color: Colors.orange,size: 16,),
                    SizedBox(width: 10,),
                    Checkbox(
                      value: _ischecked, 
                      onChanged: (value){
                        setState(() {
                          _ischecked = value!;
                        });
                      },
                      activeColor: Color(0xFF6AC8FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Payment Details",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height:10,),
          Text(
            "Please fill ou tthe form below. Enter your card account details",
            style: TextStyle(
              color: Colors.grey[500]
              
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Card Number",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height:10,),
          TextFormField(
            decoration: InputDecoration(
              hintText: "1243 3545 5657 7655",
              filled: false,
              suffixIcon: Icon(Icons.credit_card_outlined, color: Colors.blue,),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5),
                
              )
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6AC8FF),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
            ),
            child: Text(
              "Pay Now",
              
            )
          ),
        ),
      ),
    );
  }
}