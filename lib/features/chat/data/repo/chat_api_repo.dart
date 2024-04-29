
import 'dart:convert';
import 'package:gpt_app/features/chat/data/models/model-response.dart';
import 'package:gpt_app/features/chat/data/models/user-message.dart';
import 'package:gpt_app/core/networking/api_service/api_constants.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/chat_model.dart';
import '../models/models_model.dart';
part 'chat_api_repo.g.dart';

@RestApi(baseUrl: ApiChatConstants.BASE_URL)
abstract class ChatApiRepo {
  factory ChatApiRepo(Dio dio, {String baseUrl}) = _ChatApiRepo;

  @GET(ApiChatConstants.models)
  @Headers(ApiChatConstants.headers)
  Future<List<ModelsModel>> getModels();

  @POST(ApiChatConstants.chat)
  @Headers({
    'Authorization': 'Bearer ${ApiChatConstants.API_KEY}',
    "Content-Type": "application/json"
  })
  @JsonEncoder()
  // Send Message using ChatGPT API
  Future<ModelResponse> sendMessageGPT(
    @Body() UserMessage message,
  );

// @POST(ApiChatConstants.completions)
// Future<SignupResponse> signup(
//   @Body() SignupRequestBody signupRequestBody,
// );
}
