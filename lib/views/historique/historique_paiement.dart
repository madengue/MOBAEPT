import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafacture/component/colors.dart';
import 'package:mafacture/controllers/client_controller.dart';
import 'package:mafacture/controllers/histo_paie_controller.dart';
import 'package:mafacture/views/base/custom_loader.dart';
import 'package:mafacture/widgets/big_text.dart';

class HistoriquesPaiements extends StatelessWidget {
  const HistoriquesPaiements({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoriqueController paiements = Get.put(HistoriqueController());
    final ClientController client = Get.put(ClientController());
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        centerTitle: true,
        title: const Text("Historiques de paiements"),
        actions: [
          IconButton(
            onPressed: () {
              // PanaraConfirmDialog.show(
              //   context,
              //   title: "Bonjour !",
              //   message:
              //       "Cette application a ete developper et designer par NTAS-SERVICES",
              //   confirmButtonText: "En savoir plus",
              //   cancelButtonText: "Quitter",
              //   onTapCancel: () {
              //     Navigator.pop(context);
              //   },
              //   onTapConfirm: () {
              //     Navigator.pop(context);
              //   },
              //   panaraDialogType: PanaraDialogType.,
              //   barrierDismissible:
              //       false, // optional parameter (default is true)
              // );
              //showAboutDialog(context: context);
              showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: BigText(text: "Creer par NTAS-SERVICES"),
                    );
                  }));
            },
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Obx(
        () {
          if (paiements.loading == false) {
            return const Center(
              child: CustomLoader(),
              // child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: paiements.histiques.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  height: 190,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      // topLeft: Radius.circular(30),
                      // bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffd8dbe0),
                          offset: Offset(1, 1),
                          blurRadius: 20.0,
                          spreadRadius: 10)
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: Row(
                          children: [
                            const Text("Numero Compteur : "),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(".................................."),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              client.clients[index].meter_number,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: Row(
                          children: [
                            const Text("Paye le : "),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                                "...................................................."),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              paiements.histiques[index].received_on,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: Row(
                          children: [
                            const Text(
                              "Payer par : ",
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                                "................................................."),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              paiements.histiques[index].payment_method,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: Row(
                          children: [
                            const Text("Montant : "),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                                "................................................."),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${paiements.histiques[index].amount} FCFA',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: Row(
                          children: [
                            const Text("Unites : "),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                                "....................................................."),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${client.clients[index].price} FCFA',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.only(top: 15, left: 10, right: 10),
                      //   child: Row(
                      //     children: [
                      //       const Text("Unites : "),
                      //       const SizedBox(
                      //         width: 5,
                      //       ),
                      //       const Text(
                      //           "....................................................."),
                      //       const SizedBox(
                      //         width: 5,
                      //       ),
                      //       Text(
                      //         client.clients[index].zone,
                      //         style: const TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.green),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                );
              }),
            );
          }
        },
      ),
    );
  }
}
