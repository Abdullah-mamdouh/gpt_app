import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';
import 'colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font28WhiteBold = TextStyle(
    fontSize: 28.sp,
    color: ColorsManager.whiteColor,
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font20WhiteBold = TextStyle(
    fontSize: 20.sp,
    color: ColorsManager.whiteColor,
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12WhiteSemiBold = TextStyle(
    fontSize: 12.sp,
    color: ColorsManager.whiteColor,
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font12LightGraySemiBold = TextStyle(
    fontSize: 12.sp,
    color: ColorsManager.lightGrayColor,
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeightHelper.semiBold,
  );
static TextStyle font16WhiteBold = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.whiteColor,
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.whiteColor,
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16RedMedium = TextStyle(
    fontSize: 16.sp,
    color: Colors.red,
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14WhiteMedium = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.whiteColor,
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font16YellowDarkMedium = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.yellowDarkColor,
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeightHelper.medium,
  );
}
