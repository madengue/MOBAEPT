// ignore_for_file: sized_box_for_whitespace, unused_local_variable, file_names, prefer_interpolation_to_compose_strings, unused_import, unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mafacture/component/colors.dart';
import 'package:mafacture/controllers/data_controller.dart';
import 'package:mafacture/views/base/custom_loader.dart';
import 'package:mafacture/views/payment/payment.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mafacture/views/historique/historique_paiement.dart';
import 'package:mafacture/widgets/buttoms.dart';
import 'package:mafacture/widgets/text_size.dart';

import '../../controllers/client_controller.dart';
import '../../controllers/facture_controller.dart';
import '../../routes/route_helper.dart';
import '../details_facture/details_bills.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataController _controller = Get.put(DataController());
  final ClientController client = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    //print(_controller.list);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            //_listBills(),
            Obx(() {
              if (_controller.loading == false) {
                return Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    //child: const CircularProgressIndicator(),
                    child: const CustomLoader(),
                  ),
                );
              } else {
                return _listBills();
              }
            }),
            //  _payButtom(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttomContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
      bottom: 10,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/background.png",
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
      right: -1,
      bottom: 5,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/curve.png",
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  _buttomContainer() {
    return Positioned(
        bottom: 0,
        right: 43,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              barrierColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext bc) {
                return Container(
                    // height: MediaQuery.of(context).size.height - 180,
                    // child: Stack(
                    //   children: [
                    //     Positioned(
                    //       bottom: 10,
                    //       child: Container(
                    //         color: const Color(0xffeef1f4).withOpacity(0.5),
                    //         width: MediaQuery.of(context).size.width,
                    //         height: MediaQuery.of(context).size.height - 300,
                    //       ),
                    //     ),
                    //     Positioned(
                    //       top: 10,
                    //       right: 41,
                    //       child: Container(
                    //         padding: const EdgeInsets.only(top: 5, bottom: 25),
                    //         width: 60,
                    //         height: 170,
                    //         decoration: BoxDecoration(
                    //           color: AppColor.mainColor,
                    //           borderRadius: BorderRadius.circular(29),
                    //         ),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             AppButtom(
                    //               icon: Icons.cancel,
                    //               text: "fermer",
                    //               iconColor: AppColor.mainColor,
                    //               textColor: Colors.white,
                    //               backgroundColor: Colors.white,
                    //               ontap: (() {
                    //                 Navigator.pop(context);
                    //               }),
                    //             ),
                    //             AppButtom(
                    //               icon: CupertinoIcons.person,
                    //               text: "Profile",
                    //               iconColor: AppColor.mainColor,
                    //               textColor: Colors.white,
                    //               backgroundColor: Colors.white,
                    //               ontap: (() {
                    //                 Get.to(const AccountPage());
                    //               }),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //width: ,
                    );
              },
            );
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      "images/lines.png",
                    ),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                    color: const Color(0xff11324d).withOpacity(0.2),
                  )
                ]),
          ),
        ));
  }

  _listBills() {
    return Positioned(
      top: 200,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: _controller.list.length,
          itemBuilder: ((_, index) {
            return GestureDetector(
              onTap: () {
                //Get.to(() => const Detail(pageId: null, prevPage: '',));
                Get.toNamed(RouteHelper.getDetail(index, "detail-bill"));
                //Get.to(const Detail());
                // print("print");
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                height: 120,
                width: MediaQuery.of(context).size.width - 20,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffd8dbe0),
                          offset: Offset(1, 1),
                          blurRadius: 20.0,
                          spreadRadius: 10)
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 3),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      "images/and.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    //'',
                                    'Montant: ' +
                                        _controller.list[index].amount +
                                        ' FCFA',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColor.mainColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Date: " + _controller.list[index].due_date,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColor.mainColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Index : " +
                                        _controller.list[index].finals +
                                        ' m3',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColor.mainColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Penalites : " +
                                        _controller.list[index].penality +
                                        " fcfa",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColor.mainColor,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedText(
                            text: 'Echeance ' +
                                _controller.list[index].final_date,
                            color: AppColor.green,
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  /*
                                  if (_controller.list[index].status == 0) {
                                    _controller.list[index].status == 1;
                                  } else if (_controller.list[index].status ==
                                      1) {
                                    _controller.list[index].status == 0;
                                  }

                                  _controller.list.refresh();
                                  print(_controller.list[index].status);
                                  
*/
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    //color: _controller.list[index].status == 0? AppColor.selectBackground : AppColor.green
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Select ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                "",
                                //_controller.list[index].due_amount! + ' FCFA',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'Statut: ' + _controller.list[index].status,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.idColor,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 5,
                            height: 35,
                            decoration: BoxDecoration(
                                color: AppColor.halfOval,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// _payButtom() {
//return Positioned(
//  bottom: 10,
// child: LargeButtom(
// text: 'Payer les factures',
// textColor: Colors.white,
//ontap: () {
// MaterialPageRoute(builder: ((context) => const Payment()));
// Get.to(const Payment());
// print("Tapped");
//// },
// ),
// );

_textContainer() {
  return Stack(
    children: const [
      Positioned(
        left: 0,
        top: 100,
        child: Text(
          "GIC AEPT",
          style: TextStyle(
            fontFamily: '',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color(0XFF293952),
          ),
        ),
      ),
      Positioned(
        left: 40,
        top: 80,
        child: Text(
          "Mes Factures",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ],
  );
}
