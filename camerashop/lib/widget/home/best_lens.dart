import 'package:camerashop/model/product/product.dart';
import 'package:camerashop/services/productAPI.dart';
import 'package:camerashop/widget/product/productItem.dart';
import 'package:flutter/material.dart';

class BestLens extends StatelessWidget {
  const BestLens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Best Lens for You",
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
                    if(product.category == "Lens")
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