import 'package:camerashop/model/product/product.dart';
import 'package:camerashop/services/productAPI.dart';
import 'package:camerashop/widget/product/productItem.dart';
import 'package:flutter/material.dart';

class SpecialPrice extends StatefulWidget {
  const SpecialPrice({super.key});

  @override
  State<SpecialPrice> createState() => _SpecialPriceState();
}

class _SpecialPriceState extends State<SpecialPrice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Special Price for You",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 300,
          child: FutureBuilder<List<Product>>(
            future: Productapi.getProducts(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }
              final products = snapshot.data!;
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for(var product in products)
                    Productitem(product: product,),
                ],
              );
            }
          ),
        )
      ],
    );
  }
}