import 'package:gpt_app/features/chat/data/models/chat_model.dart';
import 'package:gpt_app/features/chat/data/repo/chat_api_repo.dart';
import 'package:gpt_app/features/chat/data/repo/chat_data_repo.dart';
import 'package:gpt_app/features/chat/logic/chat_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gpt_app/features/chat/data/models/local_chat_model.dart';
import 'package:hive/hive.dart';
import '../../features/chat/data/models/user-message.dart';
import '../../features/chat/data/repo/local_chat_repo/local_chat_repo.dart';
import '../networking/api_service/dio_factory.dart';
import '../theming/app_theme_cubit/app_theme_cubit.dart';
import '../utils/constants.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  //key
  const chatsKey = 'chats';
  //adapters
  Hive.registerAdapter(LocalChatModelAdapter());
  Hive.registerAdapter(ChatModelAdapter());
  Hive.registerAdapter(MessageAdapter());
  //box
  final chatsBox = await Hive.openBox<LocalChatModel?>(chatsKey);

  //repos
  LocalChatRepo(chatsBox: chatsBox);

  /// Dio
  Dio dio = DioFactory.getDio();

  //Box of theme in hive local data
  final appThemeBox = await Hive.openBox(themeKey);

  //App theme app_theme_cubit
  getIt.registerFactory(() => AppThemeCubit(themeBox: appThemeBox));

  /// chat repo
  getIt.registerLazySingleton(() => ChatApiRepo(dio));
  getIt.registerLazySingleton(() => ChatDataRepo(chatApiRepo: getIt()));
  getIt.registerLazySingleton(() => LocalChatRepo(chatsBox: chatsBox));

  /// chat cubit
  getIt.registerFactory(() => ChatCubit(chatDataRepo: getIt(),localChatRepo: getIt()));

}
