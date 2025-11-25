import 'package:camerashop/model/brand/brand.dart';
import 'package:camerashop/services/brandAPI.dart';
import 'package:flutter/material.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [  
        Row(
          children: [
            Text(
              "Brands",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: (){}, 
              child: Text(
                "See All",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              )
            )
          ],
        ),
        SizedBox(height: 20),
        Container(
          height: 150,
          child: FutureBuilder<List<Brand>>(
            future: Brandapi.getBrands(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }
              final brands = snapshot.data!;
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [ 
                  for(var brand in brands)
                    Padding(
                      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(brand.image),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            brand.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              );
            }
          ),
        )
      ],
    );
  }
}