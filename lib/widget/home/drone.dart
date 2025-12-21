import 'package:camerashop/model/product/product.dart';
import 'package:camerashop/services/productAPI.dart';
import 'package:camerashop/widget/product/productItem.dart';
import 'package:flutter/material.dart';

class Drone extends StatefulWidget {
  final String keyword;
  Drone({required this.keyword});

  @override
  State<Drone> createState() => _DroneState();
}

class _DroneState extends State<Drone> {
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
  void didUpdateWidget(covariant Drone oldWidget) {
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
        .where((p) =>(p.category.toLowerCase() == "dslr" || p.category.toLowerCase() == "drone") && p.title.toLowerCase().contains(widget.keyword.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if(filtered.isEmpty){
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Drone and DSLR",
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
