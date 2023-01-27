import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafacture/widgets/big_text.dart';
import 'package:mafacture/widgets/small_text.dart';

import '../util/colors.dart';
import '../util/dimensions.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String foodTitle;
  const AppColumn({Key? key, required this.foodTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Food Name
        BigText(text: foodTitle, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        // Rating and Comments
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(Icons.star,
                    color: AppColors.mainsColor, size: Dimensions.font15),
              ),
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "1,217"),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(height: Dimensions.height5),
        SmallText(
          text: "A recupere aujourd'hui. 11h - 13h",
          color: AppColors.mainColor,
        ),
        SizedBox(height: Dimensions.height5),
        //Spicy IconText, Distance IconText and Cooking Time IconText
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: CupertinoIcons.circle,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              icon: CupertinoIcons.location,
              text: "600 m",
              iconColor: AppColors.mainColor,
            ),
            IconAndTextWidget(
              icon: Icons.timelapse,
              text: "16 mins",
              iconColor: AppColors.mainsColor,
            ),
          ],
        ),

        // Spicy, Distance and Time Cooking
      ],
    );
  }
}
