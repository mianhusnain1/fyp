// ignore_for_file: non_constant_identifier_names

class UserModel {
  late String id;
  late String name;
  late String email;
  late String role;
  late String created_at;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.created_at,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    role = json["role"];
    created_at = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['created_at'] = created_at;
    return data;
  }
}
