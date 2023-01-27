// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mafacture/util/app_constants.dart';

import '../models/Data_model.dart';

class DataServices {
  //final String _baseUrl = "http://192.168.43.186:8080/api/";
  final String _baseUrl = AppConstants.BASE_URL;

  Future<List<DataModel>> getUser() async {
    String apiUri = AppConstants.FACTURES_LIST;
    //String apiUri = "factures";

    http.Response response = await http.get(Uri.parse(_baseUrl + apiUri));

    try {
      if (response.statusCode == 200) {
        print(await json.decode(response.body));
        List<dynamic> list = await json.decode(response.body);
       // print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        print("Something went wrong");

        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      print("failed");
      return <DataModel>[];
    }
    //   var info = rootBundle.loadString("json/data.json");
    //   List<dynamic> list = json.decode(await info);

    //   return Future.delayed(
    //       const Duration(seconds: 5), () => list.map((e) => e).toList());
    // }
  }
}
