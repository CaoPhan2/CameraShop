import 'dart:convert';
import 'package:camerashop/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> handleLogin() async {
    const String apiUrl = 'https://dummyjson.com/auth/login';

    setState(() => _isLoading = true); // Bật vòng xoay loading

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _usernameController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // 1. Giải mã JSON
        final data = jsonDecode(response.body);
        String token = data['accessToken'] ?? data['token'];

        // 2. Chuyển sang màn hình Profile và gửi kèm Token
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng nhập thành công!')),
          );
          
          Navigator.pushReplacement( 
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(accessToken: token),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng nhập thất bại. Vui lòng kiểm tra lại!')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi kết nối: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false); 
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, 
            end: Alignment.center, 
            colors: [
              Color(0xFF6AC8FF),
              Colors.white,     
            ],
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_enhance, color: Colors.lightBlue, size: 30,),
                  SizedBox(width: 10,),
                  Text(
                    "My.Capture",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Sign In Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        color: Colors.grey[600]
                      ) ,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6AC8FF))
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none
                      ),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "insert your username, please!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.grey[600]
                      ) ,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock_outlined),
                      suffixIcon: Icon(Icons.visibility_outlined, size: 16,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6AC8FF))
                      ),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "insert your password, please!";
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: Text("Forgot password?", style: TextStyle(color: Color(0xFF6AC8FF)),),
                      )
                    ]
                  ),

                  _isLoading ? const CircularProgressIndicator() : 
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6AC8FF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        ),
                        
                      ),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          handleLogin();
                        }
                      }, 
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Login"
                        ),
                      )
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "or login with",
                          style: TextStyle(
                            color: Colors.grey[500]
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    onPressed: (){}, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Google_Favicon_2025.svg/960px-Google_Favicon_2025.svg.png"))
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Continue with Google",
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    onPressed: (){}, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apple_rounded, size: 30,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Continue with Apple",
                            style: TextStyle(
                              color: Colors.grey[500]
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?"
                        ),
                        TextButton(onPressed: (){}, child: Text("Sign Up"))
                      ],
                    ),
                  ),
                ],
              )

            
            ),
            Text(
              "By Signing in, you agree to our Tems and Conditions, learn how we use your data in our Privacy Policy",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}