// ignore_for_file: public_member_api_docs, sort_constructors_first

class MeModel {
  int? id;
  String? first_name;
  String? last_name;
  String? phone_number;
  String? full_name;
  String? email;

  MeModel(
      {required this.id,
      required this.first_name,
      required this.last_name,
      required this.email,
      required this.phone_number,
      required this.full_name});

  factory MeModel.fromJson(Map<String, dynamic> json) {
    return MeModel(
      id: json["id"],
      last_name: json["first_name"],
      first_name: json["first_name"],
      email: json["email"],
      phone_number: json["phone_number"].toString(),
      full_name: json["full_name"],
    );
  }
}
