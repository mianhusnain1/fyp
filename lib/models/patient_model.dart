class PatientModel {
  late String id;
  late String name;
  late String email;
  late String image;
  late String phone;
  late String address;
  late String city;
  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.address,
    required this.city,
  });

  PatientModel.fromJson(Map<String, dynamic> json) {
    name = json["name"] ?? "";
    id = json["id"] ?? "";
    email = json["email"] ?? "";
    image = json["image"] ?? "";
    phone = json["phone"] ?? "";
    address = json["address"] ?? "";
    city = json["city"] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["image"] = image;
    data["phone"] = phone;
    data["address"] = address;
    data["city"] = city;
    return data;
  }
}
