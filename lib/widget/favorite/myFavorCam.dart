import 'package:camerashop/model/favoriteProduct/favorProduct.dart';
import 'package:camerashop/widget/product/productItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Myfavorcam extends StatelessWidget {
  const Myfavorcam({super.key});

  @override
  Widget build(BuildContext context) {
    final favList = context.watch<FavoriteProductList>();
    final favorites = favList.favorites;

    return Column(
      children: [
        favorites.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(child: Text("No favorite product added yet.")),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: favorites.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 230,
                mainAxisExtent: 300,
                childAspectRatio: 0.75,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return Productitem(product: favorites[index]);
              },
            ),
      ],
    );
  }
}
