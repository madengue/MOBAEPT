// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:get/get.dart';

import '../data/repository/auth_repo.dart';
import '../models/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ReaponseModel> login(String email, String password) async {
    print("Getting token");
    print(authRepo.getUserToken().toString());
    //authRepo.getUserToken();
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ReaponseModel reaponseModel;
    if (response.statusCode == 200) {
      print("bakend token");
      //authRepo.saveUserToken(response.body["token"]);
      print("My user tkoen is " + response.body["token"]);
      print(response.body["token"].toString());
      reaponseModel = ReaponseModel(true, response.body["token"]);
    } else {
      reaponseModel = ReaponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return reaponseModel;
  }

  void saveUserNumberAndPassword(String email, String password) {
    authRepo.saveUserNumberAndPassword(email, password);
  }

  bool clearsharedData() {
    return authRepo.clearSharedData();
  }
}
