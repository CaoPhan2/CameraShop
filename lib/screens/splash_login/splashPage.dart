import 'package:flutter/material.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://instax.co.uk/wp-content/uploads/sites/3/2024/07/small-High-res-INSTAX-MINI-99-Lifestyle-Long-exposure-on-a-tripod-1-1.jpg"),
              fit: BoxFit.cover,
            )
          ),
        ),
        Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Click & Snap: Easy shopping, Better photos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "From cameras to accesstories, everything is at your fingertips",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                  ),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      for(int i=0;i<4;i++)
                      Icon(Icons.horizontal_rule, color: Colors.white,size: 40,),

                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white, size: 15,),
                        
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,),
                        
                      )
                    ],
                  )
                ],
              )
            ],
          )
        )
      ],
    );
  }
}