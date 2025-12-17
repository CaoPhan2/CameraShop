import 'package:camerashop/model/Cart/Cart.dart';
import 'package:camerashop/screens/checkout_payment/receiptPage.dart';
import 'package:camerashop/widget/checkout_payment/checkOutItem.dart';
import 'package:flutter/material.dart';

class Checkoutpage extends StatefulWidget {
  const Checkoutpage({super.key});
  @override
  State<Checkoutpage> createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  bool _cardChecked = false;
  bool _mobileChecked = false;
  final _formKey = GlobalKey<FormState>();
  double total = Cart().items.fold(0, (sum, item) => sum + item.product.price * item.Quantity);
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
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_horiz)
              ),
            )
          ],
        )
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(15),
        children: [
          for(var item in Cart().items)
          Checkoutitem(product: item.product,quantity: item.Quantity,),
          SizedBox(height: 20,),
          Text(
            "Total Price: \$${total.toStringAsFixed(2)}",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
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
            "Cao Phan Nguyen",
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
                    "Email address",
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
          SizedBox(height:10,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[100],
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
                    Icon(Icons.credit_card,color: Colors.blue,size: 24,),
                    SizedBox(width: 10,),
                    Icon(Icons.credit_score_outlined, color: Colors.orange,size: 24,),
                    SizedBox(width: 10,),
                    Checkbox(
                      value: _cardChecked,
                      onChanged: (value) {
                        setState(() {
                          _cardChecked = value!;
                          _mobileChecked = false;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _cardChecked ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Payment Details",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height:10,),
                          Text(
                            "Please fill out the form below. Enter your card account details",
                            style: TextStyle(
                              color: Colors.grey[500]
                            
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              labelText: "your name on card",
                              hintText: "Nguyen Van A",
                              filled: false,
                              suffixIcon: Icon(Icons.person, color: Colors.blue,),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5),
                              
                              )
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty) {
                                return 'Please enter a valid name';
                              }
                            },
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 16,
                                  decoration: InputDecoration(
                                  labelText: "Card Number",
                                  hintText: "1243 3545 5657 7655",
                                  filled: false,
                                  suffixIcon: Icon(Icons.credit_card_outlined, color: Colors.blue,),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(5),
                                  )
                                  ),
                                validator: (value) {
                                  if(value == null || value.isEmpty || value.length < 16) {
                                    return 'Please enter your card number';
                                  }
                                },
                                ),
                              ),
                              SizedBox(width: 5,),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 4,
                                  decoration: InputDecoration(
                                    labelText: "Cvv",
                                    hintText: "123",
                                    filled: false,
                                    suffixIcon: Icon(Icons.lock_outline, color: Colors.blue,),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(5),
                                    
                                    )
                                  ),
                                  validator: (value) {
                                    if(value == null || value.isEmpty || value.length < 3) {
                                      return 'Please enter your CVV';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          
                          
                        ],
                      )
                      : Container(),
                    ],
                  )),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Pay on Delivery"
                    ),
                    Spacer(),
                    Icon(Icons.mobile_friendly,color: Colors.blue,size: 24,),
                    SizedBox(width: 10,),
                   
                    Checkbox(
                      value: _mobileChecked,
                      onChanged: (value) {
                        setState(() {
                          _mobileChecked = value!;
                          _cardChecked = false;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),

          
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: (){
              if(!_cardChecked && ! _mobileChecked){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please select a payment method'))
                );
                return;
              }
              if(_cardChecked){
                if(_formKey.currentState!.validate() == false){
                  return;
                }
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) => Receiptpage(total: total,),));
            },
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
