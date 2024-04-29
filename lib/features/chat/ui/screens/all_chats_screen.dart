
import 'package:gpt_app/core/utils/constants.dart';
import 'package:gpt_app/core/helpers/extensions.dart';
import 'package:gpt_app/core/routing/routes.dart';
import 'package:gpt_app/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/services.dart';
import '../../logic/chat_state.dart';

class AllChatsScreen extends StatefulWidget {
  const AllChatsScreen({Key? key}) : super(key: key);

  @override
  State<AllChatsScreen> createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen> {

  @override
  void initState() {
    context.read<ChatCubit>().emitGetChatStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // print(chats.length.toString() +"dssssssssssssfdsaaaaaaaaaaaaa");
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon: Image.asset(AssetsManager.openaiLogo,), onPressed: () { },),
        ),
        title: const Text("ChatGPT"),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.displayTextInputDialog(context);
            },
            icon: const Icon(Icons.add_circle, color: Colors.black),
          ),
        ],
      ),
//sk-proj-hwC8a3MrlRrCmbHGOUdsT3BlbkFJoasjmso5VrCvN2AbOn5p
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          var chats = ChatCubit.allChats;
          if(state is Loading){
            return CircularProgressIndicator(color: Colors.yellow,);
          }
          return ListView.builder(
           itemCount: chats.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  context.pushNamed(Routes.messagesScreen,arguments: chats[index]!.name);
                },
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.green,backgroundImage: AssetImage('assets/images/gpt.png'),radius: 30,),
                    Text('${chats[index]!.name}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Pallete.mainFontColor),),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
