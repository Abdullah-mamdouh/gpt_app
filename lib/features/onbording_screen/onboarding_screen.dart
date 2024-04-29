import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpt_app/core/helpers/constants_strings.dart';
import 'package:gpt_app/core/helpers/extensions.dart';
import 'package:gpt_app/core/routing/routes.dart';
import 'package:gpt_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:gpt_app/core/theming/colors.dart';
import 'package:gpt_app/core/theming/styles.dart';
import 'package:gpt_app/core/utils/constants.dart';
import 'package:gpt_app/features/onbording_screen/widgets/bouncing_button.dart';
import 'package:gpt_app/features/onbording_screen/widgets/onboarding_widget.dart';

import '../../core/helpers/spacing.dart';
import '../../core/theming/assets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 70),
      margin: EdgeInsets.symmetric(horizontal: 5.0.w),
      height: 3.0.h,
      width: isActive ? 24.0.w : 24.0.w,
      decoration: BoxDecoration(
        color: isActive
            ? AppThemeCubit.isDarkMode
                ? ColorsManager.lightTealColor
                : Colors.indigo[500]
            : AppThemeCubit.isDarkMode
                ? ColorsManager.lightGrayColor
                : ColorsManager.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppThemeCubit.isDarkMode
      //     ? ColorsManager.grayMedium
      //     : ColorsManager.lightTealColor,
      body: SingleChildScrollView(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: <Widget>[
                  verticalSpace(50),
                  Image.asset(
                    AppAssets.vectorGPTImage,
                    height: 30.h,
                    width: 30.w,
                    fit: BoxFit.fill,
                  ),
                  verticalSpace(30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: Text(
                      welcomeToChatGPTKey,
                      style: TextStyles.font20WhiteBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpace(30),
                  Text(
                    askAnythingKey,
                    style: TextStyles.font12WhiteSemiBold,
                  ),
                  verticalSpace(30),
                  Container(
                    height: 400.h,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) => OnboardingWidget(
                        iconPath: attribute[_currentPage]['iconPath'],
                        title: attribute[_currentPage]['title'],
                        description: attribute[_currentPage]['description'],
                      ),
                    ),
                  ),
                  verticalSpace(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  verticalSpace(20),
                  BouncingButton(
                    color: AppThemeCubit.isDarkMode
                        ? ColorsManager.lightTealColor
                        : Colors.indigo[500],//ColorsManager.mainColor,
                    child: Text(
                      _currentPage == 2 ? letChatKey : nextKey,
                      style: TextStyles.font16WhiteBold,
                    ),
                    onPress: () {
                      _currentPage != 2
                          ? setState(() {
                              _currentPage = _currentPage + 1;
                            })
                          : context.pushNamed(Routes.homeScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
