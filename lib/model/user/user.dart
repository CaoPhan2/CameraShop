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
  final DateTime? updatedAt;

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
    this.updatedAt,
  });

  // JSON → User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      phone: json['phone'],
      address: json['address'],
      role: json['role'],
      password: json['password'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  // User → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'phone': phone,
      'address': address,
      'role': role,
      'password': password,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // User rỗng (tránh crash)
  factory User.empty() {
    return User(
      id: '',
      name: 'Unknown',
      email: '',
      avatar: 'https://via.placeholder.com/150',
      phone: '',
      address: '',
      role: '',
      password: '',
      createdAt: DateTime.now(),
      updatedAt: null,
    );
  }
}
