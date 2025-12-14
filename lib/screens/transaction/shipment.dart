import 'package:camerashop/model/transaction/tracking.dart';
import 'package:flutter/material.dart';

class Shipment extends StatelessWidget {
  final Tracking tracking;
  const Shipment({super.key, required this.tracking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Track Shipment",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Divider(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tracking number",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    tracking.trackingNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.copy,color: Color(0xFF6AC8FF),)
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order ID",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    tracking.orderId,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    tracking.customerName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Date",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    tracking.deliveryDate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shipping Service",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      tracking.shippingService,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 252, 255),
              border: Border.all(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Estimated Arrival",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Your order is being processed for shipment. Estimated arrival date is june 28 2025 - june 30 2025",
                  style: TextStyle(
                    color: Colors.grey[700]
                  ),
                )
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 10,),
          
          for(int i=0; i<tracking.timeline.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: tracking.timeline[i].isCompleted ? Color(0xFF6AC8FF) : Colors.grey[500],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      tracking.timeline[i].date,
                      style: TextStyle(
                        color: tracking.timeline[i].isCompleted ? Color(0xFF6AC8FF) : Colors.grey[500],
                      ),
                    ),
                    Spacer(),
                    Text(
                      tracking.timeline[i].time,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    )
            
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      margin: EdgeInsets.only(left: 40),
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: tracking.timeline[i].isCompleted ? Color(0xFF6AC8FF) : Colors.grey.shade500,))
                      ),
                      child: Text(
                        tracking.timeline[i].description,
                      style: TextStyle(
                        color: tracking.timeline[i].isCompleted ? Color(0xFF6AC8FF) : Colors.grey[500],
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
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
                padding: EdgeInsets.symmetric(vertical: 18,horizontal: 85),
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF6AC8FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Color(0xFF6AC8FF))
                )
              ),
              onPressed: (){},
              child: Text(
                "Complain",
               
              )
            ),

            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18,horizontal: 85),
                backgroundColor: Color(0xFF6AC8FF),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Color(0xFF6AC8FF))
                )
              ),
              onPressed: (){},
              child: Text(
                "Complete"
              )
            )
          ],
        ),
      ),
    );
  }
}
