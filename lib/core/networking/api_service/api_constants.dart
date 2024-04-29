class ApiChatConstants {
  static const String BASE_URL = "https://api.openai.com/v1/";
  static const String models = "models";
  static const String chat = "chat/completions";
  static const String completions = "completions";
// sk-proj-BF4PdsZM5GxDvqlPa4WXT3BlbkFJzRvGfKDSYVagE4XtaY3O sk-proj-hwC8a3MrlRrCmbHGOUdsT3BlbkFJoasjmso5VrCvN2AbOn5p
  static const String API_KEY = "sk-proj-BF4PdsZM5GxDvqlPa4WXT3BlbkFJzRvGfKDSYVagE4XtaY3O";
  static const Map<String, dynamic> headers =  {
    'Authorization': 'Bearer ${ApiChatConstants.API_KEY}',
    "Content-Type": "application/json"
  };
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
