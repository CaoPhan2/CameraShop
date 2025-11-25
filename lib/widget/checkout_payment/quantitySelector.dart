import 'package:camerashop/model/Cart/Cart.dart';
import 'package:flutter/material.dart';

class Quantityselector extends StatefulWidget {
  final CartItem cartItem;
  final VoidCallback onChanged;  //thông báo thay đổi quantity khi nhấn + -
  const Quantityselector({super.key, required this.cartItem, required this.onChanged});

  @override
  State<Quantityselector> createState() => _QuantityselectorState();
}

class _QuantityselectorState extends State<Quantityselector> {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
                if(widget.cartItem.Quantity > 1){
                  widget.cartItem.Quantity--;
                  widget.onChanged();
                }
              });
          },
          child: Icon(
              
              Icons.remove_circle,size: 20,
              color: Colors.grey[300],
          ),
        ),
        SizedBox(width: 5,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 1,horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            widget.cartItem.Quantity.toString(),
            style: TextStyle(
              fontSize: 10
            ),
          ),
        ),
        SizedBox(width: 5,),
        InkWell(
          onTap: () {
            setState(() {
                widget.cartItem.Quantity++; 
                widget.onChanged();              
            });
          },
          child: Icon(
              
              Icons.add_circle,size: 20,
              color: Color(0xFF6AC8FF),
          ),
        ),
      ],
    );
  }
}