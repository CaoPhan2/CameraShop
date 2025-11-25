import 'package:camerashop/widget/other/appBar.dart';
import 'package:camerashop/widget/other/bottomAppBar.dart';
import 'package:camerashop/widget/transaction/transactionItem.dart';
import 'package:flutter/material.dart';

class Transactionspage extends StatelessWidget {
  const Transactionspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 156, 219, 255),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Appbar(),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.center,
            colors: [
              Color.fromARGB(255, 156, 219, 255),
              Colors.white
            ]
          )
        ),
        child: ListView(
          padding: EdgeInsets.all(15),
          scrollDirection: Axis.vertical,
          children: [
            Row(
              children: [
                Text(
                  "My Transaction",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Sort by"
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
            Divider(),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF6AC8FF)
                  ),
                  child: Text(
                    "All",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                    color: Colors.white
                  ),
                  child: Text(
                    "Process",
                    
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                    color: Colors.white
                  ),
                  child: Text(
                    "Shipping",
                    
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                    color: Colors.white
                  ),
                  child: Text(
                    "Complete",
                    
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "1 June 2025",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500]
                ),
              ),
            ),
            for(int i=0;i<4;i++)
            Transactionitem(),
          ],
        ),
      ),
      bottomNavigationBar: Bottomappbar(currentIndex: 3),
    );
  }
}