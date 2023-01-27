// ignore_for_file: unnecessary_import, implementation_imports

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafacture/views/auth/sign_in.dart';
import 'package:mafacture/views/home/homePage.dart';

import '../../util/dimensions.dart';
import '../../widgets/big_text.dart';
import '../BottomNavBar/nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // _loadResource();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    Timer(
      const Duration(seconds: 7),
      () => Get.to(const NavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "images/and.png",
                    width: Dimensions.width250,
                  ),
                ),
              ],
            )),
          ),
          const SizedBox(
            height: 30,
          ),
          BigText(text: "GIC Actions d'Entraide Pour Tous"),
        ],
      ),
    );
  }
}
