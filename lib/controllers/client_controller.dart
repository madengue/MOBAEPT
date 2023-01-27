import 'package:get/state_manager.dart';
import 'package:mafacture/services/client_services.dart';

import '../models/Data_client.dart';


class ClientController extends GetxController{
 RxList<DataClient> clients = <DataClient>[].obs;
  final service = ClientServices();


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
      var infos = service.getClient();
      clients.addAll(await infos);
    } catch (e) {
      print("error");
      print(e);
    } finally {
     // _loading.value = true;
    }
  }
}