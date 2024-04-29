import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gpt_app/core/helpers/extensions.dart';
import 'package:gpt_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:gpt_app/features/chat/data/models/user-message.dart';
import 'package:gpt_app/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt_app/features/chat/ui/widgets/inter_actins_widget.dart';
import 'package:provider/provider.dart';
import '../../../../core/helpers/constants_strings.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/assets.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/chat_model.dart';
import '../../logic/chat_state.dart';
import '../widgets/chat_widget.dart';
import '../widgets/text_widget.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreen({super.key, this.chatName = 'new', this.newChat = false});
  bool newChat;
  String chatName;
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  // bool _isTyping = false;
  late String chatName;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    chatName = widget.chatName;
    ChatCubit.chatList = [];
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (chatName != 'new') {
      context.read<ChatCubit>().emitGetChatMessagestates(chatName);
    }

    return Scaffold(
      backgroundColor: AppThemeCubit.isDarkMode
          ? ColorsManager.lightDarkColor
          : Colors.indigo[300],
      body: BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
        var msg = ChatCubit.chatList;
        return SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.arrowLeftImage,
                            height: 20.h,
                          ),
                          horizontalSpace(15),
                          Text(
                            backKey,
                            style: TextStyles.font16WhiteBold,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppAssets.vectorGPTImage,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: ColorsManager.whiteColor.withOpacity(0.5),
                thickness: 2.0,
              ),
              Flexible(
                child: ListView.builder(
                    controller: _listScrollController,
                    itemCount: msg.length, //chatList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0.h, horizontal: 20.0.w),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ChatWidget(
                                  msg:
                                      ChatCubit.chatList[index].message.content,
                                  // chatList[index].msg,
                                  chatIndex: (msg[index].index),
                                  //chatList[index].chatIndex,
                                  shouldAnimate: msg.length - 1 == index,
                                ),
                                msg[index].index == 0
                                    ? InterActionsWidget()
                                    : SizedBox(),
                              ],
                            ),
                            state is Loading
                                ? Container(
                                    height: 50.h,
                                    width: 70.w,
                                    child: SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(
                                            msg[index].index == 0 ? 12 : 0),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      );
                    }),
              ),
              verticalSpace(15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Material(
                  color: AppThemeCubit.isDarkMode
                      ? ColorsManager.grayMedium
                      : Colors.indigo[400], //cardColor,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: focusNode,
                            style: const TextStyle(color: Colors.white),
                            controller: textEditingController,
                            onSubmitted: (value) async {
                              // await sendMessageFCT();
                            },
                            decoration: const InputDecoration.collapsed(
                                hintText: "How can I help you",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (chatName == 'new' &&
                                textEditingController.text.isNotEmpty) {
                              debugPrint(textEditingController.text +
                                  'eeeeeeeeeeeeeeeeee');
                              ChatCubit.get(context).emitAddChatStates(
                                  textEditingController.text);
                              // setState(() {
                              debugPrint(textEditingController.text +
                                  "qqqqqqqqqqqqqqqqqqqqqqqq");
                              chatName = textEditingController.text;
                              // });
                            }

                            await sendMessageFCT();
                          },
                          child: Container(
                            height: 45.h,
                            width: 45.w,
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0.r),
                              color: AppThemeCubit.isDarkMode
                                  ? ColorsManager.lightTealColor
                                  : Colors.indigo[500],
                            ),
                            child: Image.asset(
                              AppAssets.sendImage,
                              // fit: BoxFit.fill,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT() async {
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else {
      try {
        // String msg =textEditingController.text;
        // context.read<ChatCubit>().addUserMessage(
        //     msg: ChatModel(message: Message(content: textEditingController.text), index: 1),
        //     chatName: chatName);
        // textEditingController.clear();
        await context.read<ChatCubit>().emitSendMessageStates(
            UserMessage(
                message: [Message(content: textEditingController.text)],
                model: 'gpt-3.5-turbo-0301'),
            chatName);
        textEditingController.clear();
        scrollListToEND();
      } catch (error) {
        log("error $error");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: TextWidget(
            label: error.toString(),
          ),
          backgroundColor: Colors.red,
        ));
      } finally {
        // setState(() {
        scrollListToEND();
        //_isTyping = false;
        // });
      }
    }
  }
}
