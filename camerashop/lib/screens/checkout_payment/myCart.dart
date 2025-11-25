import 'package:camerashop/model/Cart/Cart.dart';
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
      body: ListView.builder(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.title,
                        style: TextStyle(
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
                  Spacer(),
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
            
            Row(
              children: [
                Text(
                  "Address:"
                ),
                Spacer(),
                Text(
                  "32/131 Trần Phú, Tp Huế, Thừa Thiên Huế",
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
              onPressed: (){},
                child: Text(
                "Pay Now",
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