import 'package:flutter/material.dart';
import 'package:mafacture/component/colors.dart';
import 'package:get/get.dart';
import 'package:mafacture/services/client_services.dart';
import 'package:mafacture/services/data_services.dart';
import 'package:mafacture/services/me_services.dart';
import 'package:mafacture/services/paiement_services.dart';
import 'helpers/dependencies.dart' as dep;

import 'routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<DataServices>().getUser();
    Get.find<ClientServices>().getClient();
    Get.find<HistoriqueServices>().getHitorique();
    Get.find<MeServices>().getMe();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ma facture',
      theme: ThemeData(
        primaryColor: AppColor.mainColor,
        // primarySwatch: Colors.transparent
      ),
      // home: const SplashScreen(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
  }
}
