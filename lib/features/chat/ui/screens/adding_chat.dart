
import 'package:gpt_app/core/utils/services.dart';
import 'package:flutter/material.dart';

class AddingChat extends StatefulWidget {
  const AddingChat({Key? key}) : super(key: key);

  @override
  State<AddingChat> createState() => _AddingChatState();
}

class _AddingChatState extends State<AddingChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
          onPressed: (){
            Services.displayTextInputDialog(context);
          }, color: Colors.red,child: Text("Add Chat")),


    );
  }
}
