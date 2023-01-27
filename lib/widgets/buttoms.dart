// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mafacture/component/colors.dart';

class AppButtom extends StatelessWidget {
  final double fontSize;
  final IconData icon;
  final Function()? ontap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String? text;
  const AppButtom({
    Key? key,
    this.fontSize = 20,
    required this.icon,
    this.ontap,
    this.backgroundColor = AppColor.mainColor,
    this.iconColor = Colors.white,
    this.textColor = AppColor.mainColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor),
            child: Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
          ),
          text != null
              ? Text(
                  text!,
                  style: TextStyle(fontSize: 14, color: textColor),
                )
              : Container()
        ],
      ),
    );
  }
}
