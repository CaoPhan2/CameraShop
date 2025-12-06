class User {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String phone;
  final String address;
  final String role;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.phone,
    required this.address,
    required this.role,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"], 
      name: json["name"], 
      email: json["email"],  
      avatar: json["avatar"], 
      phone: json["phone"],  
      address: json["address"], 
      role: json["role"],  
      password: json["password"],  
      createdAt: json["createdAt"],  
      updatedAt: json["updateAt"], 
    );
  }
}