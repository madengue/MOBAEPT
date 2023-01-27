// ignore_for_file: avoid_print

import 'package:mafacture/models/paiement_historique.dart';
import 'package:mafacture/util/app_constants.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HistoriqueServices {
  //final String _baseUrl = "http://192.168.43.186:8080/api/";
  final String _baseUrl = AppConstants.BASE_URL;

  Future<List<HistoriquePaiement>> getHitorique() async {
    String apiUri = AppConstants.HISTORIQUE;
    //String apiUri = "factures";

    http.Response response = await http.get(Uri.parse(_baseUrl + apiUri));

    try {
      if (response.statusCode == 200) {
        print(await json.decode(response.body));
        List<dynamic> histiques = await json.decode(response.body);
        //print(histiques);
        return histiques.map((e) => HistoriquePaiement.fromJson(e)).toList();
      } else {
        print("Something went wrong");

        return <HistoriquePaiement>[];
      }
    } catch (e) {
      print(e);
      print("failed");
      return <HistoriquePaiement>[];
    }
    //   var info = rootBundle.loadString("json/data.json");
    //   List<dynamic> list = json.decode(await info);

    //   return Future.delayed(
    //       const Duration(seconds: 5), () => list.map((e) => e).toList());
    // }
  }
}
