class User {
  final String? id;
  final String? role;
  final String? name;
  final String? email;
  final String? password;
  final String? token;
  final String imageUrl;

  User({
    this.name,
    this.email,
    this.password,
    this.token,
    this.imageUrl = '',
    this.role,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      role: json['role'],
      name: json['name'],
      email: json['email'],
      imageUrl: json['imageUrl'] ?? '',
      password: json['password'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'password': password,
      'token': token,
      'role': role,
      'id': id,
    };
  }
}
