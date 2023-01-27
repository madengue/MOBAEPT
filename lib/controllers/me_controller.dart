// ignore_for_file: avoid_print

import 'package:get/state_manager.dart';
import 'package:mafacture/models/me_model.dart';
import 'package:mafacture/services/me_services.dart';

class MeController extends GetxController {
  RxList<MeModel> users = <MeModel>[].obs;
  final service = MeServices();

  // final _loading = false.obs;

  // get loading {
  //   return _loading.value;
  // }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  _loadData() async {
    // _loading.value = false;
    try {
      var infos = service.getMe();
      users.addAll(await infos);
    } catch (e) {
      print("error");
      print(e);
    } finally {
      // _loading.value = true;
    }
  }
}
