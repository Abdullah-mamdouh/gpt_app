import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpt_app/core/theming/colors.dart';
import 'package:gpt_app/core/theming/styles.dart';

class TextCardWidget extends StatelessWidget {
  TextCardWidget({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: ColorsManager.lightDarkColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
      child: Center(
        child: Text(
          text,
          style: TextStyles.font14WhiteMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
