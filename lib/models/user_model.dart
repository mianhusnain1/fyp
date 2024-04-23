class UserModel {
  late String id;
  late String name;
  late String email;
  late String role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
