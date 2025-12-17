import 'package:camerashop/model/transaction/transaction.dart';
import 'package:camerashop/services/transaction.dart';
import 'package:camerashop/widget/other/appBar.dart';
import 'package:camerashop/widget/other/bottomAppBar.dart';
import 'package:camerashop/widget/transaction/transactionItem.dart';
import 'package:flutter/material.dart';

class Transactionspage extends StatefulWidget {


  const Transactionspage({super.key});

  @override
  State<Transactionspage> createState() => _TransactionspageState();
}

class _TransactionspageState extends State<Transactionspage> {
  List<Transaction> listTrans=[];
  List<Transaction> displayTransactions = [];
  void initState(){
    super.initState();
    loadTransaction();
  }
  void loadTransaction() async{
    listTrans = await transactionAPI.getTransaction();
    if(!mounted) return;
    setState(() {
      displayTransactions = listTrans;
    });
  }

  //hiển thị theo trạng thái đó cha
  void fillterByStatus(String status){
    setState(() {
      selectedStatus = status;
      if(status == "All"){
        displayTransactions = listTrans;
      }else{
        displayTransactions = listTrans.where((transaction)=> transaction.status == status).toList();
      }
    });
  }

  //Tkiem
  String keyword ="";
  void onSearch(String value){
    setState(() {
      keyword = value;
    });
  }

  // phần ni là select trạng thái giao hèng
  String selectedStatus = "All";
  Widget statusButton(String title) {
    final bool isSelected = selectedStatus == title;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF6AC8FF) : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          fillterByStatus(title);
        },
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 156, 219, 255),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Appbar(onSearch: onSearch,),
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
            
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  statusButton("All"),
                  statusButton("Processing"),
                  statusButton("Shipping"),
                  statusButton("Completed"),
                  statusButton("Cancelled"),
                ],
              ),
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
            displayTransactions.isEmpty 
              ? Center(child: CircularProgressIndicator(),) 
              : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: displayTransactions.length,
                itemBuilder: (context, index){
                  return Transactionitem(transaction: displayTransactions[index],);
                }
                ) 
          ],
        ),
      ),
      bottomNavigationBar: Bottomappbar(currentIndex: 3,),
    );
  }
}



