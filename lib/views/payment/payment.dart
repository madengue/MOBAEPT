// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafacture/component/colors.dart';
import 'package:mafacture/widgets/buttoms.dart';
import 'package:get/get.dart';

import '../../widgets/large_buttom.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20),
        height: h,
        width: w,
        //width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/paymentbackground.png",
              ),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: h * 0.10,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/success.png",
                      ),
                      fit: BoxFit.fitWidth),
                ),
              ),
              const Text(
                "Succes !",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.mainColor,
                ),
              ),
              Text(
                "Paiement effectuer pour vos factures",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.idColor),
              ),
              SizedBox(
                height: h * 0.045,
              ),
              Container(
                height: 180,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 3,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (_, index) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 15, left: 25, bottom: 10),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.green),
                                  child: const Icon(
                                    CupertinoIcons.check_mark_circled,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CamWater",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.idColor),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "ID:1443723",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.idColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.mainColor),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "1289 FCFA",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.mainColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Column(
                children: [
                  Text(
                    "Montant Total",
                    style: TextStyle(fontSize: 20, color: AppColor.idColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "3200 FCFA",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColor.idColor,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.1,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     AppButtom(icon: Icons.share, text: "Partager"),
              //     SizedBox(
              //       width: 80,
              //     ),
              //     AppButtom(icon: CupertinoIcons.printer, text: "Imprimer"),
              //   ],
              // ),
              SizedBox(
                height: h * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const LargeButtom(
                  text: 'OKAY',
                  backgroundColor: Colors.white,
                  textColor: AppColor.mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
