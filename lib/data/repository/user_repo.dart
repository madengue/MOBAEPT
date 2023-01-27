import 'package:get/get.dart';
import 'package:mafacture/data/api/apiClient.dart';
import 'package:mafacture/util/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;

  UserRepo({
    required this.apiClient,
  });
  Future<Response> getUserInfos() async {
    return await apiClient.getData(
      AppConstants.USER_INFO_URI,
    );
  }
}
