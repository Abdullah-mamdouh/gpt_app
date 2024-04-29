import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpt_app/core/helpers/constants_strings.dart';
import 'package:gpt_app/core/helpers/spacing.dart';
import 'package:gpt_app/core/theming/assets.dart';
import 'package:gpt_app/core/theming/colors.dart';
import 'package:gpt_app/core/theming/styles.dart';
import 'package:gpt_app/features/onbording_screen/widgets/text_card_widget.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget(
      {Key? key,
      required this.title,
      required this.iconPath,
      required this.description})
      : super(key: key);

  String iconPath;
  String title;
  List description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(iconPath,width: 20,height: 20,fit: BoxFit.fill,),
        // CircleAvatar(
        //   backgroundImage: AssetImage(iconPath),
        //   radius: 20.r,
        // ),
        verticalSpace(20),
        Text(
          title,
          style: TextStyles.font16WhiteMedium,
        ),
        verticalSpace(30),
        TextCardWidget(text:  description[0],),

        verticalSpace(20),
        TextCardWidget(text:  description[1],),
        verticalSpace(20),

        TextCardWidget(text:  description[2],),
      ],
    );
  }
}
