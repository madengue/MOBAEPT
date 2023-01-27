import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafacture/component/colors.dart';
import 'package:mafacture/controllers/client_controller.dart';
import 'package:mafacture/util/colors.dart';
import 'package:mafacture/util/dimensions.dart';
import 'package:mafacture/widgets/account_widget.dart';
import 'package:mafacture/widgets/app_icon.dart';
import 'package:mafacture/widgets/big_text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    // bool userLoggedIn = Get.find<AuthController>().userLoggedIn();

    // if (userLoggedIn) {
    //   Get.find<UserController>().getUserInfos();
    // }

    final ClientController me = Get.put(ClientController());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.mainColor,
          title: const Text("Profile"),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: ((context, _) {
              return Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(top: 20, right: 110, left: 110),
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xffd8dbe0),
                            offset: Offset(1, 1),
                            blurRadius: 20.0,
                            spreadRadius: 10)
                      ],
                    ),
                    child: const Icon(
                      CupertinoIcons.person,
                      size: 60,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    // height: 55,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          //topRight: Radius.circular(30),
                          // bottomLeft: Radius.circular(30),
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
                        AccountWidget(
                          appIcon: AppIcon(
                            backgroundColor: AppColor.mainColor,
                            iconSize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                            icon: CupertinoIcons.location,
                            iconColor: Colors.white,
                          ),
                          bigText: BigText(text: me.clients[_].city),
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        //Numero
                        AccountWidget(
                          appIcon: AppIcon(
                            backgroundColor: AppColors.iconColor2,
                            iconSize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                            icon: CupertinoIcons.phone,
                            iconColor: Colors.white,
                          ),
                          bigText: BigText(text: ""),
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        //Email
                        AccountWidget(
                          appIcon: AppIcon(
                            backgroundColor: Colors.pink,
                            iconSize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                            icon: CupertinoIcons.mail,
                            iconColor: Colors.white,
                          ),
                          bigText: BigText(text: ""),
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                      ],
                    ),
                  )
                ],
              );
            })));
  }
}
