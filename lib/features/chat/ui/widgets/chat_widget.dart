
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gpt_app/core/theming/colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
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
      decoration: BoxDecoration(
        color: chatIndex == 1 ? ColorsManager.lightTealColor : ColorsManager.lightGrayColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(chatIndex == 1 ? 12 : 0),
          bottomLeft: Radius.circular(chatIndex == 1 ? 0 : 12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Image.asset(
              chatIndex == 1
                  ? AssetsManager.userImage
                  : AssetsManager.botImage,
              height: 30,
              width: 30,
            ),*/
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
            chatIndex == 1
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.thumb_down_alt_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
