class ApiResponse {
  late Object _data;
  late Object _apiError;

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ApiErrors => _apiError as Object;
  set ApiErrors(Object error) => _apiError = error;
}