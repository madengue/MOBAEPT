// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mafacture/util/dimensions.dart';

class CustomButtom extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttomText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final IconData? icon;
  const CustomButtom({
    Key? key,
    this.onPressed,
    required this.buttomText,
    required this.transparent,
    this.margin,
    this.height,
     this.width= 250,
    required this.fontSize,
    this.radius = 5,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButton = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent
              ? Colors.transparent
              : Theme.of(context).primaryColor,
      maximumSize: Size(width == null ? Dimensions.screenWidth:width!,
          height != null ? height! : 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    return Center(
      child: SizedBox(
        width: width ?? Dimensions.screenWidth,
        height: height ?? 50,
        child: TextButton(
          onPressed: onPressed,
          style: _flatButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: Dimensions.width10 / 2),
                      child: Icon(icon,
                          color: transparent
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).canvasColor),
                    )
                  : const SizedBox(),
              Text(
                buttomText,
                style: TextStyle(
                    fontSize: fontSize ?? Dimensions.font16,
                    color: transparent
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).cardColor),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}
