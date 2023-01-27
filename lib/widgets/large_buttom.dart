// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mafacture/component/colors.dart';

class LargeButtom extends StatelessWidget {
  final Color? backgroundColor;
  final String text;
  final Color? textColor;
  final Function()? ontap;
  final bool isBorder;
  const LargeButtom({
    Key? key,
    this.backgroundColor = AppColor.mainColor,
    required this.text,
    this.textColor,
    this.ontap,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: AppColor.mainColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
