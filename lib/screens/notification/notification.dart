import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Notification"
            ),
            Spacer(),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert),
            ),
          ],
        )
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.local_offer_outlined,
                        size: 24,
                        color: Color(0xFF6AC8FF), // light blue cho nổi
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sales"),
                          Text(
                            "Your voucher will expire at 23:55 on January 21, 2026, so please place your order today.",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                SizedBox(height: 10,),
                Divider(),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.receipt_long,
                        size: 24,
                        color: Colors.amber, // light blue cho nổi
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Update Shop"),
                          Text(
                            "Your account has just been logged in using Face ID.",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                SizedBox(height: 10,),
                Divider(),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.local_shipping_outlined,
                        size: 24,
                        color: Colors.red, // light blue cho nổi
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Orders"),
                          Text(
                            "Your order is in Ho Chi Minh city",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text(
                    "Update Orders",
                  ),
                  Spacer(),
                  Text(
                    "Seen all",
                  )
                ],
              ),
            ),
          ),

          Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 20),
                    child: Icon(Icons.shopping_cart_checkout_outlined, size: 100,color: Colors.lightBlue,),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/");
                    }, 
                    child: Text("Shopping Now"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      foregroundColor: Colors.lightBlue,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colors.lightBlue, 
                          width: 1,          
                        ),
                      ),
                      
                    ),
                  )
                ],
              ),
            ),
        ],
      )
    );
  }
}