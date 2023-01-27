// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, deprecated_member_use, avoid_unnecessary_containers, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mafacture/component/colors.dart';
import 'package:mafacture/controllers/client_controller.dart';
import 'package:mafacture/util/colors.dart';
import 'package:mafacture/widgets/big_text.dart';
import 'package:mafacture/widgets/custom_buttom.dart';
import 'package:mafacture/widgets/small_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/data_controller.dart';

class Detail extends StatelessWidget {
  final int pageId;
  final String prevPage;
  Detail({Key? key, required this.pageId, required this.prevPage})
      : super(key: key);

  void _launchURLOrangemoney(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  void _launchURLMtnmoney(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  // final DataController _controller = Get.put(DataController());

  final ClientController _client = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    var factures = Get.find<DataController>().list[pageId];
    //var client = Get.find<ClientController>().clients;
    //Get.find<FacturesController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColor.mainColor,
        title: const Text(
          "Details facture",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 540,
              child: ListView.builder(
                itemCount: factures.id.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                    height: 495,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffd8dbe0),
                            offset: Offset(1, 1),
                            blurRadius: 20.0,
                            spreadRadius: 10)
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                //"",
                                'No Compteur: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text('..............................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _client.clients[index].meter_number,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'D.index: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text(
                                  '.........................................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.initial + ' m3',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'Index: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text(
                                  '.............................................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.finals + ' m3',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'Maintenance: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text('..............................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.maintenance_fees + ' fcfa',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'Pu: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text(
                                  '...................................................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.units + ' fcfa',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'Consomation: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text('.............................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.due_amount + ' fcfa',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'Penalites: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text(
                                  '......................................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.penality + ' fcfa',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'Echeance: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text(
                                  '.....................................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.due_date,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'Statut: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text(
                                  '.............................................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.status,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Row(
                          //   children: [
                          //     const Text(
                          //       //"",
                          //       'Recue le: ',
                          //       style: TextStyle(
                          //           fontSize: 16,
                          //           color: AppColor.mainColor,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //     const SizedBox(
                          //       width: 2,
                          //     ),
                          //     const Text('.'),
                          //     const SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text(
                          //       factures.createdAt,
                          //       style: const TextStyle(
                          //           fontSize: 16,
                          //           color: AppColor.mainColor,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'Index Total: ',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text('..............................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.finals + ' m3',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                //"",
                                'Montant Total: ',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text('........................'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                factures.amount + ' fcfa',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            children: const [
                              Text(
                                //"",
                                'Regler vos factures par OM ou MOMO en cliquant sur le bouton ci dessous.',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // bouton de redirection numeros
            CustomButtom(
              buttomText: "Payer votre facture",
              transparent: false,
              fontSize: 16,
              icon: Icons.payment,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        title: SmallText(
                          text: "Veuillez choisir",
                          size: 20,
                          color: AppColor.mainColor,
                        ),
                        content: SizedBox(
                            width: double.maxFinite,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _launchURLMtnmoney(
                                      "tel:*126*4*611153%23",
                                    );
                                    // print("Successfully");
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.yellowColor,
                                            image: const DecorationImage(
                                              image: AssetImage("images/m.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        BigText(text: "Mtn Mobile Money"),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 1,
                                  decoration: const BoxDecoration(
                                    //borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // const Spacer()
                                GestureDetector(
                                  onTap: () {
                                    //print("Successfully");
                                    _launchURLOrangemoney(
                                        "tel:%23150*47*609594%23");
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColor.mainColor,
                                            image: const DecorationImage(
                                              image: AssetImage("images/o.png"),
                                              // fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        BigText(text: "Orange Money"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
