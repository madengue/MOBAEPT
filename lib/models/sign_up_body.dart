// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpBody {
  String name;
  String email;
  String phone;
  String password;

  SignUpBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["first_name"] = name;
    data["phone_number"] = phone;
    data["email"] = email;
    data["password"] = password;

    return data;
  }
}
