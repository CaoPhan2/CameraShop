import 'package:camerashop/model/product/product.dart';
import 'package:camerashop/services/productAPI.dart';
import 'package:camerashop/widget/product/productItem.dart';
import 'package:flutter/material.dart';

class SpecialPrice extends StatefulWidget {
  final String keyword;
  SpecialPrice({required this.keyword});

  @override
  State<SpecialPrice> createState() => _SpecialPriceState();
}

class _SpecialPriceState extends State<SpecialPrice> {
  List<Product> allProducts = [];
  List<Product> filtered = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProduct();
  }

  // Khi widget.keyword thay đổi, tự động lọc lại
  @override
  void didUpdateWidget(covariant SpecialPrice oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.keyword != widget.keyword) {
      filterProducts();
      setState(() {}); // cập nhật UI với keyword mới
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
        .where((p) => p.title.toLowerCase().contains(widget.keyword.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Special Price for You",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          height: 300,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    return Productitem(product: filtered[index]);
                  },
                ),
        ),
      ],
    );
  }
}
