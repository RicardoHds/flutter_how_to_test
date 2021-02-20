import 'dart:io';
import 'package:DevSecOps/services/httpClient.dart';
import 'package:dio/dio.dart';

class LoginService {
  HttpClient _httpClient = HttpClient();

  Future<dynamic> signIn(Map<String, String> body) async {
    var _url = '/token';

    Response response = await _httpClient.postUrlEncoded(_url, body: body);

    return response;
  }
}
