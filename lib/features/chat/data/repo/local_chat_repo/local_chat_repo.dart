import 'package:gpt_app/features/chat/data/models/local_chat_model.dart';
import 'package:gpt_app/features/chat/data/models/user-message.dart';
import 'package:hive/hive.dart';

import '../../../../../core/networking/api_service/api_result.dart';
import '../../../../../core/networking/error_handler_base.dart';
import '../../models/chat_model.dart';

class LocalChatRepo {
  LocalChatRepo({required Box<LocalChatModel?> chatsBox}) : _chatsBox = chatsBox;

  final Box<LocalChatModel?> _chatsBox;
  Box<ChatModel>? chatsBox;

  Future<void> addChat({required String chatName}) async{
    await _chatsBox.add(LocalChatModel(chatName));
    openBox(chatName);
  }

  Future<ServiceResult<List<LocalChatModel?>>> fetchAllLocalChats() async {

    try{
      final localChats = await _chatsBox.values.toList();
      for(int i =0;i< localChats.length; i++){
        print(localChats[i]!.toJson().toString()+"ggggggggggggggggggggggggggggggg");
      }

      return ServiceResult.success(localChats);
    } catch (errro) {
      print("sfdadsssssssssssssssssssssssssss");
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }

  }

  Future<ServiceResult<List<ChatModel>>> fetchLocalChatMessages(String chatName) async {
   await openBox(chatName);
    try{
      final chatDetails = await chatsBox!.values.toList();

      return ServiceResult.success(chatDetails);
    } catch (errro) {
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }

  }

  openBox(String chatName) async{
    if(!(Hive.isBoxOpen(chatName))){
      chatsBox = await Hive.openBox<ChatModel>(chatName);
    }
    chatsBox = Hive.box(chatName);
  }

  Future<void> addMessage({required String chatName,required ChatModel message}) async{
    openBox(chatName);
    await chatsBox!.add(message);
  }

  clearChat(String chatName) async{
    // openBox(chatName);
    await chatsBox!.deleteFromDisk();
  }

  clearLocalChats() async {
    //await fetchAllLocalChats();
    try{
      final localChats = await _chatsBox.values.toList();
      for(int i =0;i< localChats.length; i++){
        print(localChats[i]!.toJson().toString()+"ggggggggggggggggggggggggggggggg");
        await clearChat(localChats[i]!.name);
      }

    } catch (errro) {
      print("sfdadsssssssssssssssssssssssssss");
    }

  }


}

