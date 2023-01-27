// ignore_for_file: avoid_print

import 'package:get/state_manager.dart';
import 'package:mafacture/models/paiement_historique.dart';
import 'package:mafacture/services/paiement_services.dart';

class HistoriqueController extends GetxController {
  RxList<HistoriquePaiement> histiques = <HistoriquePaiement>[].obs;
  final service = HistoriqueServices();

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
      var infos = service.getHitorique();
      histiques.addAll(await infos);
    } catch (e) {
      print("error");
      print(e);
    } finally {
       _loading.value = true;
    }
  }
}
