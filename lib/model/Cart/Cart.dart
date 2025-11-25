import 'package:camerashop/model/product/product.dart';

class CartItem{
  final Product product;
  int Quantity;
  bool isSelected;

  CartItem({required this.product, this.Quantity=1, this.isSelected = false});
  double get totalPrice => product.price * Quantity;
}

class Cart {
  // 1. Private constructor
  Cart._privateConstructor();

  // 2. Instance duy nhất, đảm bảo trong app chỉ dungf mot giohang
  static final Cart _instance = Cart._privateConstructor();

  // 3. Factory trả về instance duy nhất
  factory Cart() => _instance;

  List<CartItem> items = [];
  
  // Them san phaamr
  void addToCart(Product product){
    // neeus sản phẩm này đã có trong giỏ hàng thì tăng số lượng
    for(var item in items){  
      if(item.product.id == product.id){
        item.Quantity +=1;
        item.isSelected = true;  // đánh dấu đã đc chọn trong giỏ h
        return;
      }
    }
    // nếu chưa thì thêm vào
    items.add(CartItem(product: product, isSelected: true));

  }

  void removeCartItem(int id){
    items.removeWhere((item)=> item.product.id == id);
  }

  void SelectAll(bool Selected){
    for(var item in items){
      item.isSelected = Selected;
    }
  }

  double get TotalSelectedPrice{
    double total = 0;
    for(var item in items){
      if(item.isSelected){
        total += item.totalPrice;
      }
    }
    return total;
  }

}