import 'package:camerashop/model/product/product.dart';
import 'package:camerashop/services/productAPI.dart';
import 'package:camerashop/widget/product/productItem.dart';
import 'package:flutter/material.dart';

class BestLens extends StatefulWidget {
  final String keyword;
  const BestLens({super.key, required this.keyword});

  @override
  State<BestLens> createState() => _BestLensState();
}

class _BestLensState extends State<BestLens> {
  List<Product> allProducts = [];
  List<Product> filtered = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProduct();
  }

  @override
  void didUpdateWidget(covariant BestLens oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.keyword != widget.keyword) {
      filterProducts();
      setState(() {});
    }
  }

  void loadProduct() async {
    allProducts = await Productapi.getProducts();
    filterProducts();
    setState(() {
      isLoading = false;
    });
  }

  void filterProducts() {
    filtered = allProducts
        .where((p) =>
            p.category.toLowerCase() == "lens" &&
            p.title.toLowerCase().contains(widget.keyword.toLowerCase()))
        .toList();
  }

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

        // Hiển thị lens đã lọc
        Container(
          height: 300,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var product in filtered)
                      Productitem(product: product),
                  ],
                ),
        )
      ],
    );
  }
}
