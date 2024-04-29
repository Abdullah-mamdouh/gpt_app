import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpt_app/core/theming/colors.dart';

import '../../../../core/helpers/spacing.dart';

import '../../../../core/theming/styles.dart';

class IconAndTextRowWidget extends StatelessWidget {
  IconAndTextRowWidget(
      {Key? key,
      required this.iconPath,
      required this.text,
      this.textStyle ,
      })
      : super(key: key);

  String iconPath;
  String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.0.w),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            height: 16.h,
          ),
          horizontalSpace(20),
          Text(
            text,
            style: textStyle == null ?TextStyles.font16WhiteMedium : textStyle,
          )
        ],
      ),
    );
  }
}
