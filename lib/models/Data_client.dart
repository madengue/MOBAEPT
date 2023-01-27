// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class DataClient {
  String user_id;
  String city;
  String localization;
  String price;
  String meter_number;
  String zone;

  DataClient({
    required this.user_id,
    required this.city,
    required this.localization,
    required this.price,
    required this.meter_number,
    required this.zone,
  });

  factory DataClient.fromJson(Map<String, dynamic> json) => DataClient(
        user_id: json["user_id"].toString(),
        city: json["city"],
        localization: json["localization"],
        price: json["price"].toString(),
        meter_number: json["meter_number"].toString(),
        zone: json["zone"].toString(),
      );
}
