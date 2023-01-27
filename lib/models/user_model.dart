// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  int? id;
  String? first_name;
  String? last_name;
  String? phone_number;
  String? phone;
  String? email;

  UserModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.phone_number,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      last_name: json["first_name"],
      first_name: json["first_name"],
      email: json["email"],
      phone_number: json["phone_number"].toString(),
      // orderCount: json["order_Count"],
    );
  }
}
