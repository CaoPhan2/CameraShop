import 'package:camerashop/model/product/product.dart';
import 'package:camerashop/services/productAPI.dart';
import 'package:camerashop/widget/product/productItem.dart';
import 'package:flutter/material.dart';

class Myfavorcam extends StatefulWidget {
  const Myfavorcam({super.key});

  @override
  State<Myfavorcam> createState() => _MyfavorcamState();
}

class _MyfavorcamState extends State<Myfavorcam> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child:
            Text(
              "My Favorite Camera",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 300,
          child: FutureBuilder<List<Product>>(
            future: Productapi.getProducts(), 
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(child : CircularProgressIndicator());
              }
              final products = snapshot.data!;
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for(var product in products)
                    if(product.category == "Camera")
                      Productitem(product: product),
                ],
              );
            }
          )
        )
      ],
    );
  }
}