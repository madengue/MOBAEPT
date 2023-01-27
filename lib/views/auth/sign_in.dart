import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafacture/component/colors.dart';
import 'package:mafacture/util/dimensions.dart';
import 'package:mafacture/views/base/show_custom_snackbar.dart';

import '../../controllers/auth_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../base/custom_loader.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    // ignore: no_leading_underscores_for_local_identifiers
    void _login(AuthController authController) {
      //var authController = Get.find<AuthController>();
      String password = passwordController.text.trim();
      String email = emailController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in your email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in valid email address",
            title: "Email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can be not be less than six characters",
            title: "Password");
      } else {
        // showCustomSnackBar("Done", title: "All done");
        authController.login(email, password).then((status) {
          if (status.isSuccess!) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message!);
          }
        });
      }
    }

    return Scaffold(body: GetBuilder<AuthController>(builder: (authController) {
      return !authController.isLoading
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: Dimensions.screenHight * 0.2),
                  //logo
                  Container(
                    child: const Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                        backgroundImage: AssetImage("images/and.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height2),
                  //welcome
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: Dimensions.width20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bienvenue",
                          style: TextStyle(
                            fontSize:
                                Dimensions.font20 * 1 + Dimensions.font20 / 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // const Text(
                        //   "Sign into your account",
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //     //fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  //email
                  AppTextField(
                      textEditingController: emailController,
                      hintText: "Email",
                      icon: CupertinoIcons.mail),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  //password
                  AppTextField(
                      isObscure: true,
                      textEditingController: passwordController,
                      hintText: "Password",
                      icon: CupertinoIcons.padlock_solid),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(child: Container()),
                  //     RichText(
                  //       text: TextSpan(
                  //         text: "Connecter vous",
                  //         style: TextStyle(
                  //             color: Colors.grey[500],
                  //             fontSize: Dimensions.font15),
                  //         // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  //       ),
                  //     ),
                  //     SizedBox(height: Dimensions.width20),
                  //   ],
                  // ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _login(authController);
                    },
                    child: Container(
                      width: Dimensions.screenWidth / 2,
                      height: Dimensions.screenHight / 13,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        color: AppColor.mainColor,
                      ),
                      child: Center(
                        child: BigText(
                          text: "Sign in",
                          size: Dimensions.font16 + Dimensions.font20 / 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.screenHight * 0.03,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     RichText(
                  //       text: TextSpan(
                  //         text: " Don't have an account ? ",
                  //         style: TextStyle(
                  //           color: Colors.grey[500],
                  //           fontSize: Dimensions.font16,
                  //         ),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         Get.to(const SignUp());
                  //       },
                  //       child: Text("Create",
                  //           style: TextStyle(
                  //             color: AppColors.mainBlackColor,
                  //             fontSize: Dimensions.font20,
                  //             fontWeight: FontWeight.bold,
                  //           )),
                  //     )
                  //     // RichText(
                  //     //   text: TextSpan(
                  //     //     recognizer: TapGestureRecognizer()
                  //     //       ..onTap = () {
                  //     //         print("tapped");
                  //     //       },
                  //     //     text: " Create",
                  //     //     style: TextStyle(
                  //     //       color: AppColors.mainBlackColor,
                  //     //       fontSize: Dimensions.font16,
                  //     //       fontWeight: FontWeight.bold,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),

                  // Wrap(
                  //   children: List.generate(
                  //     3,
                  //     (index) => Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: CircleAvatar(
                  //         radius: Dimensions.radius30,
                  //         backgroundImage: AssetImage(
                  //           "assets/image/" + SignInImages[index],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          : const CustomLoader();
    }));
  }
}
