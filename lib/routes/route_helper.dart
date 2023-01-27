import 'package:get/get.dart';
import 'package:mafacture/views/BottomNavBar/nav_bar.dart';
import 'package:mafacture/views/auth/sign_in.dart';
import 'package:mafacture/views/compte/compte.dart';
import 'package:mafacture/views/historique/historique_paiement.dart';

import '../views/details_facture/details_bills.dart';
import '../views/splash_screens/splash_screen.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splashPage = "/splash-page";
  static const String factures = "/factures";
  static const String detailBill = "/detail-bill";
  static const String historiquespaiements = "/histiques_paiements";
  static const String login = "/sign-in";
  static const String profil = "/profil";
  static const String clients = "/clients";

  static String getInitial() => initial;
  static String getSplashPage() => splashPage;
  static String getSignIn() => login;
  static String getProfil() => profil;
  static String getHistorique() => historiquespaiements;
  static String getClient() => clients;
  static String getDetail(int pageId, String prevPage) =>
      '$detailBill?pageId=$pageId&prevPage=$prevPage';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () => const NavBar(),
        transition: Transition.fadeIn),
    GetPage(
      name: detailBill,
      page: () {
        var pageId = Get.parameters['pageId'];
        var prevPage = Get.parameters['prevPage'];

        return Detail(
          pageId: int.parse(pageId!),
          prevPage: prevPage!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(
        name: login, page: () => const Login(), transition: Transition.fadeIn),
    GetPage(
        name: historiquespaiements,
        page: () => const HistoriquesPaiements(),
        transition: Transition.fadeIn),
    GetPage(
      name: profil,
      page: () => const Profile(),
      transition: Transition.leftToRight,
    )
  ];
}
