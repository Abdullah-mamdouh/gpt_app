import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants_strings.dart';
import '../../../../core/theming/assets.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
class InterActionsWidget extends StatelessWidget {
  const InterActionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 200.w,
      child: Row(

        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppAssets.likeImage,
              color: ColorsManager.lightGrayColor,),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppAssets.likeImage,
              color: ColorsManager.lightGrayColor,),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppAssets.copyImage,color: ColorsManager.lightGrayColor,),
          ),
          Text(copyKey, style: TextStyles.font12LightGraySemiBold,)
        ],
      ),
    );
  }
}
