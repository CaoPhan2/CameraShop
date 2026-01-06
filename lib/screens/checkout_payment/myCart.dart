import 'package:camerashop/model/Cart/Cart.dart';
import 'package:camerashop/screens/checkout_payment/checkOutPage.dart';
import 'package:camerashop/screens/home/home_screen.dart';
import 'package:camerashop/screens/splash_login/signInPage.dart';
import 'package:camerashop/services/auth_helper.dart';
import 'package:camerashop/widget/checkout_payment/quantitySelector.dart';
import 'package:flutter/material.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key,});
  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  bool ischecked = false;
  bool isAllChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[100],
              ),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)
              ),
            ),
            Spacer(),
            Text(
              "My Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[100],
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.edit)
              ),
            )
          ],
        ),
      ),
      body: 
      Cart().items.length== 0
      ? Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Center(
            child: Column(
              children: [
                Text("There aren't any items"),
                InkWell(
                  onTap:(){
                    Navigator.pushNamed(context, "/");
                  },
                  child: Text("Continue shopping", style: TextStyle(color: Colors.lightBlue),),)
              ],
            ),
          ),
      )
      :ListView.builder(
        padding: EdgeInsets.only(bottom: 200),
        itemCount: Cart().items.length,
        itemBuilder: (context,index){
          final cartItem = Cart().items[index];  // gán ở đâyyyyyyyyyyyyy
          return Container(
              padding: EdgeInsets.all(10),
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF5F5F5),width: 1 ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                      value: cartItem.isSelected,
                      activeColor: Color(0xFF6AC8FF),
                      checkColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          cartItem.isSelected = value!;
                        });
                      },),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(cartItem.product.images[0]),
                        fit: BoxFit.cover
                      ),
                     
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.product.title,
                          maxLines: 1,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "\$${cartItem.product.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Quantity",
                          style: TextStyle(
                            fontSize: 12
                          ),
                        ),
                        SizedBox(height: 5,),
                        Quantityselector(
                          cartItem: cartItem,
                          onChanged: (){
                            setState(() {
                             
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                 
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Cart().removeCartItem(cartItem.product.id);
                      });
                    },
                    icon: Icon(
                      Icons.close,
                      size: 18,
                    )
                  )
                ],
              ),
            );
        }
      ),
      bottomSheet: Container(  
        height: 170,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 251, 251),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
            )
          ]
        ),
        child: Column(
          children: [
           
            Row(
              children: [
                Text(
                  "Shiping option:"
                ),
                Spacer(),
                Text(
                  "Fedx",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_right)
                )
              ],
            ),
           
            Expanded(
              child: Row(
                children: [
                  Text(
                    "Address: "
                  ),
                  Spacer(),
                  Expanded(
                    child: Text(
                      "32/131 Tran Phu, Hue city, Thua Thien Hue",
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text(
                  "Total Item:"
                ),
                Spacer(),
                Text(
                  "\$${Cart().TotalSelectedPrice}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text(
                  "Shipping free:"
                ),
                Spacer(),
                Text(
                  "\$10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text(
                  "Total Payment:"
                ),
                Spacer(),
                Text(
                  "\$${Cart().TotalSelectedPrice - 10}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.only(right: 15, left: 5),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 0.8,
              child: Checkbox(
                value: isAllChecked,
                activeColor: Color(0xFF6AC8FF),
                onChanged: (value){
                  setState(() {
                    isAllChecked = value!;
                    for(var item in Cart().items){
                      item.isSelected = isAllChecked;
                    }
                  });
                }
              ),
            ),
            Text(
              "Select All",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6AC8FF),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),
              onPressed: () async{
                final hasSelected = Cart().items.any((item) => item.isSelected);
                if(!hasSelected){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select at least one product.')));
                  return;
                }

                final loggedIn = await isLoggedIn();
                if(loggedIn){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> Checkoutpage()));
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> Signinpage(redirectToCheckout: true,)));
                }
                
              },
              child: Text(
              "Checkout",
              style: TextStyle(
                color: Colors.white,      
                fontWeight: FontWeight.bold,
              )
              ),
            )
          ],
        ),
      ),
    );
  }
}
