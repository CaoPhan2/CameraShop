import 'package:camerashop/widget/other/bottomAppBar.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 223, 242, 254),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [
                Color.fromARGB(255, 156, 219, 255),
                Color.fromARGB(255, 223, 242, 254),
              ]
            )
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,  
                    image: DecorationImage(
                      image: AssetImage("assets/images/promo1.png"),
                    )
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cao Phan Nguyen",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      "caophan2106@gmail.com",
                      style: TextStyle(
                        fontSize: 12
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          children: [
            Text(
              "Account Setting",
              style: TextStyle(
                color: Colors.grey[600]
              ),
            ),
            SizedBox(height: 20,),
              Row(
                children: [
                  Icon(Icons.account_circle_outlined,),
                  SizedBox(width: 6,),
                  Text(
                    "Personal Information", 
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,size: 14,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(Icons.contact_emergency_outlined, size: 20,),
                  SizedBox(width: 10,),
                  Text(
                    "Contact & Verification", 
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,size: 14,)
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Payment",
                  style: TextStyle(
                    color: Colors.grey[600]
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.payment, size: 22),
                  SizedBox(width: 10,),
                  Text(
                    "Payment Method", 
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,size: 14,)
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Setting & Security",
                  style: TextStyle(
                    color: Colors.grey[600]
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.lock_outline_rounded),
                  SizedBox(width: 10,),
                  Text(
                    "Change Password", 
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,size: 14,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(Icons.verified_user_outlined),
                  SizedBox(width: 10,),
                  Text(
                    "Activation 2 - Factor Authentication", 
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,size: 14,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(Icons.notifications_outlined),
                  SizedBox(width: 10,),
                  Text(
                    "Notification Preference", 
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,size: 14,)
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Payment",
                  style: TextStyle(
                    color: Colors.grey[600]
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.currency_exchange,size: 20),
                  SizedBox(width: 10,),
                  Text(
                    "Currency", 
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,size: 14,)
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              SizedBox(height: 20,),
              Text(
                "Help & Support", 
              ),
          ]
          ),
      ),
      bottomNavigationBar: Bottomappbar(currentIndex: 4,),
    );
  }
}