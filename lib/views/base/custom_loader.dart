import 'package:flutter/material.dart';
import 'package:mafacture/util/dimensions.dart';

import '../../component/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    // print("J'affiche le loading state " +
    //     Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimensions.height15 * 5,
        width: Dimensions.height15 * 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.height20 * 5),
            color: AppColor.mainColor),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
