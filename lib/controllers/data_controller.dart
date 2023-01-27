// ignore_for_file: avoid_print

import 'package:get/state_manager.dart';
import 'package:mafacture/services/data_services.dart';

import '../models/Data_model.dart';

class DataController extends GetxController {
  RxList<DataModel> list = <DataModel>[].obs;
  final service = DataServices();

  final _loading = false.obs;

  get loading {
    return _loading.value;
  }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  _loadData() async {
    _loading.value = false;
    try {
      var info = service.getUser();
      list.addAll(await info);
    } catch (e) {
      print("error");
      print(e);
    } finally {
      _loading.value = true;
    }
  }
}
