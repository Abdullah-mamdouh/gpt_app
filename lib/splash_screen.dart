import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpt_app/core/helpers/constants_strings.dart';
import 'package:gpt_app/core/helpers/extensions.dart';
import 'package:gpt_app/core/helpers/spacing.dart';
import 'package:gpt_app/core/routing/routes.dart';
import 'package:gpt_app/core/theming/assets.dart';
import 'package:gpt_app/core/theming/styles.dart';

import 'core/theming/colors.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {

    Timer(
        Duration(
          seconds: 4,
        ),
            () => context.pushNamed(Routes.onboardingScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorsManager.grayMedium,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100.h,
              width: double.infinity,
              child: Image.asset(AppAssets.vectorGPTImage),
            ),
            verticalSpace(20),
            Text(chatGPTKey, style: TextStyles.font28WhiteBold,),
          ],
        ),
      ),
    );
  }
}
