import 'package:get/get.dart';
import 'package:mafacture/controllers/client_controller.dart';
import 'package:mafacture/controllers/histo_paie_controller.dart';
import 'package:mafacture/controllers/me_controller.dart';
import 'package:mafacture/data/api/apiClient.dart';
import 'package:mafacture/services/client_services.dart';
import 'package:mafacture/services/me_services.dart';
import 'package:mafacture/services/paiement_services.dart';
import 'package:mafacture/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../controllers/data_controller.dart';
import '../controllers/user_controller.dart';
import '../data/repository/auth_repo.dart';
import '../data/repository/user_repo.dart';
import '../services/data_services.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //repos
  // Get.lazyPut(() => FacturesRepo(apiClient: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => DataServices());
  Get.lazyPut(() => ClientServices());
  Get.lazyPut(() => HistoriqueServices());
  Get.lazyPut(() => MeServices());

  //controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => DataController());
  Get.lazyPut(() => ClientController());
  Get.lazyPut(() => HistoriqueController());
  Get.lazyPut(() => MeController());
}
