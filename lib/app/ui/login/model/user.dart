class UserModel {
  String? id;
  String email;
  String name;

  UserModel({
    this.id,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
    };
  }

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      id: id,
      email: json['email'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
