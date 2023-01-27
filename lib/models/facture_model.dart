// ///
// /// Generated from https://javiercbk.github.io/json_to_dart/
// /// Just input Json to the page

// // ignore_for_file: unused_field, prefer_initializing_formals

// class Facture {
//   int? _totalSize;
//    int? _Id;
//   int? _offset;
//   late List<FacturesModel> _factures;
//   List<FacturesModel> get factures => _factures;

//   Facture(
//       {
//       required totalSize,
//        required Id,
//       required offset,
//       required factures}) {
//     _totalSize = totalSize;
//    _Id = Id;
//      _offset = offset;
//     _factures = factures;
//   }

//   Facture.fromJson(Map<String, dynamic> json) {
//     _totalSize = json['total_size'];
//      _Id = json['id'];
//      _offset = json['offset'];
//     if (json['factures'] != null) {
//       _factures = <FacturesModel>[];
//       json['factures'].forEach((v) {
//         _factures.add(FacturesModel.fromJson(v));
//       });
//     }
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['total_size'] = this.totalSize;
//   //   data['type_id'] = this.typeId;
//   //   data['offset'] = this.offset;
//   //   if (this.products != null) {
//   //     data['products'] = this.products!.map((v) => v.toJson()).toList();
//   //   }
//   //   return data;
//   // }

// }

// class FacturesModel {
//   int? id;
//   String? final_date;
//   String? amount;
//   String? due_date;
//   String? maintenance_fees;
//   String? penality;
//   String? status;
//   String? initial;
//   String? units;
//   String? finals;
//   String? due_amount;
//   String? createdAt;
//   String? updatedAt;

//   // String? get img => _img;
//   // String? get name => _name;

//   FacturesModel(
//       {required id,
//       required final_date,
//       required amount,
//       required due_date,
//       required maintenance_fees,
//       required penality,
//       required status,
//       required initial,
//       required finals,
//       required due_amount,
//       required createdAt,
//       required updatedAt,
//       required units}) {
//     this.id = id;
//     this.final_date = final_date;
//     this.amount = amount;
//     this.due_date = due_date;
//     this.maintenance_fees = maintenance_fees;
//     this.penality = penality;
//     this.status = status;
//     this.initial;
//     this.finals;
//     this.due_amount;
//     this.createdAt = createdAt;
//     this.updatedAt = updatedAt;
//     //this.typeId = typeId;
//   }

//   factory FacturesModel.fromJson(Map<String, dynamic> json) {
//     return FacturesModel(
//       id: json['id'],
//       final_date: json['final_date'],
//       amount: json['amount'],
//       due_date: json['due_date'],
//       maintenance_fees: json['maintenance_fees'],
//       penality: json['penality'],
//       status: json['status'],
//       initial: json['initial'],
//       finals: json['finals'],
//       units: json['units'],
//       due_amount: json['due_amount'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   data['description'] = this.description;
//   //   data['price'] = this.price;
//   //   data['stars'] = this.stars;
//   //   data['img'] = this.img;
//   //   data['location'] = this.location;
//   //   data['created_at'] = this.createdAt;
//   //   data['updated_at'] = this.updatedAt;
//   //   data['type_id'] = this.typeId;
//   //   return data;
//   // }

//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "final_date": final_date,
//       "amount": amount,
//       "due_date": due_date,
//       "maintenance_fees": maintenance_fees,
//       "penality": penality,
//       "status": status,
//       "initial": initial,
//       "finals": finals,
//       'units': units,
//       "due_amount": due_amount,
//       "created_at": createdAt,
//       "updated_at": updatedAt,
//     };
//   }
// }
