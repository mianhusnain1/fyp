// ignore_for_file: non_constant_identifier_names

class DoctorModel {
  late String id;
  late String name;
  late String licence;
  late String catagory;
  late String email;
  late String phone;
  late String address;
  late String city;
  late String schedule;
  late String bio;
  late String image;
  late String created_at;
  late bool availability;
  late bool wrong_id_card;
  late bool wrong_licence;
  late bool approved;
  //
  DoctorModel({
    required this.catagory,
    required this.licence,
    required this.bio,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.schedule,
    required this.image,
    required this.availability,
    required this.created_at,
    required this.wrong_id_card,
    required this.wrong_licence,
    required this.approved,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    name = json["name"] ?? "";
    email = json["email"] ?? "";
    phone = json["phone"] ?? "";
    catagory = json["catagory"] ?? "";
    bio = json["bio"] ?? "";
    licence = json["lic"] ?? "";
    address = json["address"] ?? "";
    city = json["city"] ?? "";
    schedule = json["schedule"] ?? "";
    image = json["image"] ?? "";
    availability = json["availability"] ?? false;
    created_at = json["created_at"] ?? "";
    wrong_id_card = json["wrong_id_card"] ?? false;
    wrong_licence = json["wrong_licence"] ?? false;
    approved = json['approved'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["catagory"] = catagory;
    data["lic"] = licence;
    data["bio"] = bio;
    data["address"] = address;
    data["city"] = city;
    data["schedule"] = schedule;
    data["image"] = image;
    data["availability"] = availability;
    data["created_at"] = created_at;
    data["wrong_id_card"] = wrong_id_card;
    data["wrong_licence"] = wrong_licence;
    data["approved"] = approved;
    return data;
  }
}
