import 'package:camerashop/model/Cart/Cart.dart';
import 'package:camerashop/model/product/product.dart';
import 'package:camerashop/screens/checkout_payment/myCart.dart';
import 'package:camerashop/services/productAPI.dart';
import 'package:camerashop/widget/product/productItem.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // màu nền vòng tròn
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.arrow_back)
              ),
            ),
            Spacer(),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // màu nền vòng tròn
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>Mycart())
                      ).then((_)=>setState(() {}));
                    }, 
                    icon: Icon(Icons.shopping_cart_outlined)
                  ),
                ),
                if(Cart().items.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF6AC8FF),
                        border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: Text(
                          Cart().items.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    )
                  )
              ],
            ),
            SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // màu nền vòng tròn
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.share)
              ),
            ),
             SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: IconButton(
                onPressed: (){},
                 icon: Icon(Icons.more_horiz)
               ),
            )
          ],
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey[300],
              child: PageView(
                children: [
                  for(int i=0;i<widget.product.images.length;i++)
                  Image(image: NetworkImage(widget.product.images[i]), fit: BoxFit.cover,),              
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16  ),),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("\$${widget.product.price}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(width: 10),
                              Text("\$${widget.product.price-15.2}", style: TextStyle(decoration: TextDecoration.lineThrough)),
              
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber,size: 15,),
                              SizedBox(width: 5),
                              Text('4.8 (200) - '),
                              Text('${widget.product.sold} sold'),
                              SizedBox(width: 5),
                              Icon(Icons.camera_alt_outlined,size: 20, color: Colors.grey,),
                              SizedBox(width: 5),
                              Text('20 photos review'),
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Icon(Icons.star_border),
                        ],
                      )  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description product", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ReadMoreText(
                      widget.product.description,  
                      trimLines: 3,               // hiển thị 3 dòng
                      trimMode: TrimMode.Line,    
                      trimCollapsedText: ' Read more',
                      trimExpandedText: ' Show less',
                      textAlign: TextAlign.start,
                      moreStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      lessStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  )      
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "User Reviews", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 16
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 14,
                            color: Colors.blue
                          ),
                        )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber,size: 15,),
                      SizedBox(width: 5),
                      Text('4.8 (10 Rating)'),
                      SizedBox(width: 5),
                      Text('(200 Reviews)'),

                    ],
                  ),
                  Row(
                    children: [
                      for(int i=0;i<5;i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/promo1.jpg"),
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/promo1.jpg"),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'Cao Phan Nguyen'
                      )
                    ],
                  ),
                  Row(
                    children: [
                      for(int i=0;i<5;i++)
                      Icon(Icons.star, size: 15, color: Colors.amber,),
                      SizedBox(width: 5,),
                      Text(
                        '1 week ago'
                      ),
                    ],
                  ),
                  Text(
                    'Fast deliver and the items arrived safely because they were packed with bubble wrap'
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You May Also Like",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),

                  Container(
                    height: 300,
                    child: FutureBuilder<List<Product>>(
                      future: Productapi.getProducts(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        final products = snapshot.data!;

                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var p in products)
                              Productitem(product: p), // truyền product vào
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  
                  side: BorderSide(color: Color(0xFF6AC8FF), width: 1),
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF6AC8FF),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    
                  )
                ),
                onPressed: () {
                  setState(() {
                    Cart().addToCart(widget.product);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.done,size: 18,color: Colors.green,),
                          Text(' Đã thêm vào giỏ hàng',style: TextStyle(color: Colors.green),), 
                        ],
                      ),
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.white,
                      )
                    );
                  });
                },
                child: Text('Add to Cart',),
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6AC8FF),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                onPressed: () {
                  // Add to cart action
                },
                child: Text('Buy Now'),
              ),
              SizedBox(width: 20,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.message_outlined)
                ),
              )
            ],
          )
        ),
      )
    );
  }
}