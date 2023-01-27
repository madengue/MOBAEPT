// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class DataModel {
  String id;
  String final_date;
  String amount;
  String due_date;
  String maintenance_fees;
  String penality;
  String status;
  String initial;
  String units;
  String finals;
  String due_amount;
  String createdAt;
  String updatedAt;

  DataModel(
      {required this.id,
      required this.final_date,
      required this.amount,
      required this.due_date,
      required this.maintenance_fees,
      required this.penality,
      required this.status,
      required this.initial,
      required this.units,
      required this.finals,
      required this.due_amount,
      required this.createdAt,
      required this.updatedAt});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"].toString(),
        final_date: json["final_date"].toString(),
        amount: json["amount"].toString(),
        due_date: json["due_date"].toString(),
        maintenance_fees: json["maintenance_fees"].toString(),
        penality: json["penality"].toString(),
        status: json["status"],
        units: json["units"].toString(),
        due_amount: json["due_amount"].toString(),
        finals: json["finals"].toString(),
        initial: json["initial"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );
}
