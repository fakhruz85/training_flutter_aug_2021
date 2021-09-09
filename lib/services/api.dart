import 'dart:convert';
import 'dart:io';

import 'package:myapp/models/api_error.dart';
import 'package:myapp/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/user.dart';

String _baseUrl = 'amtis.opengw.net';
String _pathUrl = '/skk/api/v1';

Future<ApiResponse> authenticateUser(String username, String password) async {
  ApiResponse _apiResponse = new ApiResponse();
  var url = Uri.http('$_baseUrl', '$_pathUrl/auth/login');

  try {
    final response = await http
      .post(url, body: {'username': username, 'password': password});

    switch(response.statusCode){
      case 200:
        _apiResponse.Data = User.fromJson(json.decode(response.body));
        _apiResponse.ApiErrors = new ApiError(error: '');
        break;
      case 401:
        _apiResponse.ApiErrors = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        _apiResponse.ApiErrors = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiErrors = ApiError(error: "Server error. Please Retry");
  }

  return _apiResponse;
}

Future<ApiResponse> getUserDetails(String token) async {
  ApiResponse _apiResponse = new ApiResponse();
  var url = Uri.http('$_baseUrl', '$_pathUrl/attendance/get-profile');

  try {
    final response = await http
      .get(url,
       //Send authorization headers to the backend(server restful)
       headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

    switch(response.statusCode){
      case 200:
        _apiResponse.Data = User.fromJson(json.decode(response.body));
        _apiResponse.ApiErrors = new ApiError(error: '');
        break;
      case 401:
        _apiResponse.ApiErrors = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        _apiResponse.ApiErrors = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiErrors = ApiError(error: "Server error. Please Retry");
  }

  return _apiResponse;
}