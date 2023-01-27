// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:mafacture/models/user_model.dart';

import '../data/repository/user_repo.dart';
import '../models/response_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = false;
  UserModel? _userModel;

  bool get isLoading => _isLoading;
  UserModel? get userModel => _userModel;

  Future<ReaponseModel> getUserInfos() async {
    // _isLoading = true;

    Response response = await userRepo.getUserInfos();
    late ReaponseModel reaponseModel;
    if (response.statusCode == 200) {
      print(userModel);
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      reaponseModel = ReaponseModel(true, "Successfully");
    } else {
      print("ERRUER");
      reaponseModel = ReaponseModel(false, response.statusText!);
    }
    //_isLoading = false;
    update();
    return reaponseModel;
  }
}
