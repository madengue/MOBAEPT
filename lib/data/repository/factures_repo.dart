import 'package:get/get.dart';
import 'package:mafacture/data/api/apiClient.dart';
import 'package:mafacture/util/app_constants.dart';

class FacturesRepo extends GetxService {
  // if using GetX State Management,
  //You have to extends GetxService to get data from internet

  final ApiClient apiClient;

  FacturesRepo({required this.apiClient});

  Future<Response> getFacturesList() async {
    return apiClient.getData(AppConstants.FACTURES_LIST);
  }
}
