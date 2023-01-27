// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class HistoriquePaiement {
  String bill_id;
  String payment_method;
  String received_on;
  String amount;
  String notes;

  HistoriquePaiement({
    required this.bill_id,
    required this.payment_method,
    required this.received_on,
    required this.amount,
    required this.notes,
  });

  factory HistoriquePaiement.fromJson(Map<String, dynamic> json) =>
      HistoriquePaiement(
          bill_id: json["bill_id"].toString(),
          payment_method: json["payment_method"],
          received_on: json["received_on"].toString(),
          amount: json["amount"].toString(),
          notes: json["notes"]);
}
