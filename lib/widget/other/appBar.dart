import 'package:camerashop/model/Cart/Cart.dart';
import 'package:camerashop/screens/checkout_payment/myCart.dart';
import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  final Function(String) onSearch;
  const Appbar({super.key, required this.onSearch});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Column( 
          children: [
            Row(
              children: [
                Icon(
                  Icons.place,
                  color: Colors.red,size: 15,
                ),
                SizedBox(width: 4),
                Text("Delivery to: ",
                  style: TextStyle(
                    fontSize: 14
                  ),
                ),
                Expanded(
                  child: Text(
                    "32/131, Tran Phu, Tp Hue, Thua Thien Hue, Viet Nam",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                    overflow: TextOverflow.ellipsis, // tránh tràn
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    child: TextField(
                      onSubmitted: widget.onSearch,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        hintText: "what are you looking for?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Mycart()
                            )
                          ).then((_)=>setState(() {}));
                        }, 
                        icon: Icon(Icons.shopping_cart_outlined) 
                      ),
                    ),
                    if(Cart().items.isNotEmpty)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF6AC8FF),
                            border: Border.all(color: Colors.white)
                          ),
                          child: Center(
                            child: Text(
                              Cart().items.length.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        )
                      )
                  ]
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // màu nền vòng tròn
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.notifications_none) 
                  ),
                ),
                
              ],
            ),
          ],
        );
  }
}