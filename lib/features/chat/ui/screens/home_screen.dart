import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpt_app/core/helpers/constants_strings.dart';
import 'package:gpt_app/core/helpers/extensions.dart';
import 'package:gpt_app/core/helpers/spacing.dart';
import 'package:gpt_app/core/routing/routes.dart';
import 'package:gpt_app/core/theming/assets.dart';
import 'package:gpt_app/core/theming/colors.dart';
import 'package:gpt_app/core/theming/styles.dart';
import 'package:gpt_app/features/chat/ui/widgets/icon_and_text_row_widget.dart';
import 'package:gpt_app/features/chat/logic/chat_cubit.dart';
import '../../logic/chat_state.dart';
import 'messages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ChatCubit>().emitGetChatStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        child: Column(
          children: [
            verticalSpace(40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MessagesScreen(),
                  ),
                );
                // context.pushNamed(Routes.messagesScreen,);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.messageImage,
                          height: 20.h,
                          fit: BoxFit.fill,
                        ),
                        horizontalSpace(15),
                        Text(
                          newChatKey,
                          style: TextStyles.font16WhiteBold,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      AppAssets.arrowRightImage,
                      height: 12.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Divider(
                color: ColorsManager.whiteColor.withOpacity(0.5),
                thickness: 2.0,
              ),
            ),
            verticalSpace(8),
            Container(
              height: 400.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  var chats = ChatCubit.allChats;
                  if (state is Loading) {
                    return CircularProgressIndicator(
                      color: ColorsManager.whiteColor,
                    );
                  }
                  return ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MessagesScreen(
                                chatName: chats[index]!.name,
                              ),
                            ),
                          );
                          // context.pushNamed(Routes.messagesScreen,
                          //     arguments: chats[index]!.name);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.messageImage,
                                  height: 20.h,
                                ),
                                horizontalSpace(15),
                                Text(
                                  '${chats[index]!.name}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsManager.whiteColor),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  AppAssets.arrowRightImage,
                                  height: 20.h,
                                ))
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            verticalSpace(10),
            Divider(
              color: ColorsManager.whiteColor.withOpacity(0.5),
              thickness: 2.0,
            ),
            IconAndTextRowWidget(
                iconPath: AppAssets.clearImage, text: clearConversationsKey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconAndTextRowWidget(
                    iconPath: AppAssets.upgradeToPlusImage,
                    text: upgradeToPlusKey),
                Center(
                  child: Container(
                    height: 30.h,
                    width: 60.w,
                    margin: EdgeInsets.only(right: 20.w),
                    decoration: BoxDecoration(
                      color: ColorsManager.yellowColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      newKey,
                      style: TextStyles.font16YellowDarkMedium,
                    ),
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
            IconAndTextRowWidget(
                iconPath: AppAssets.lightModeImage, text: lightModeKey),
            IconAndTextRowWidget(
                iconPath: AppAssets.updatesToFAQImage, text: updatesFAQKey),
            IconAndTextRowWidget(
              iconPath: AppAssets.logoutImage,
              text: logoutKey,
              textStyle: TextStyles.font16RedMedium,
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
