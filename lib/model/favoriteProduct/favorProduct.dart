import 'package:camerashop/model/product/product.dart';
import 'package:flutter/material.dart';

class FavoriteProductList extends ChangeNotifier{

  final List<Product> listFavorite = [];
  List<Product> get favorites => listFavorite;

  void toggleFavorite(Product product) {
    if(listFavorite.any((item)=> item.id == product.id)){
      listFavorite.removeWhere((item)=> item.id == product.id);
    } else {
      listFavorite.add(product);
    }
    notifyListeners();
  }
  bool isFavorite(Product product) {
    return listFavorite.any((p) => p.id == product.id);
  }
}