import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpt_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:gpt_app/core/theming/colors.dart';
import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: chatIndex ==1 ?40.w: 0,
        right: chatIndex ==1 ? 0: 40.w ,
      ),
      decoration: BoxDecoration(
        color: chatIndex == 1 ? AppThemeCubit.isDarkMode ? ColorsManager.lightTealColor : Colors.indigo[200]
            : AppThemeCubit.isDarkMode ? ColorsManager.lightGrayColor : Colors.indigo[600],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(chatIndex == 1 ? 0 : 12),
          bottomLeft: Radius.circular(chatIndex == 1 ? 12 : 0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: chatIndex == 1
                  ? TextWidget(
                      label: msg,
                    )
                  : shouldAnimate
                      ? DefaultTextStyle(
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                          child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              displayFullTextOnTap: true,
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(
                                  msg.trim(),
                                ),
                              ]),
                        )
                      : Text(
                          msg.trim(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
