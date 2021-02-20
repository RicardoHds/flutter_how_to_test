import 'package:DevSecOps/constants/uri.dart';
import 'package:dio/dio.dart';

class HttpClient {
  Dio dio = new Dio();

  HttpClient() {
    dio = Dio();
    dio.options.baseUrl = URI.API;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      dio.options.headers["Authorization"] = 'Barear 1234';
      return options;
    }, onResponse: (Response response) async {
      return response;
    }, onError: (DioError e) async {
      return e.response;
    }));
  }

  Future<Response> get(String url) => dio.get(url);

  Future<Response> postUrlEncoded(String url, {dynamic body}) => dio.post(url,
      data: body,
      options: Options(contentType: Headers.formUrlEncodedContentType));

  Future<Response> postUrlFromData(String url, {dynamic body}) =>
      dio.post(url, data: body);

  Future<Response> downloadFile(String url, String path) =>
      dio.download(url, path);

  Future<Response> post(String url, {dynamic body}) =>
      dio.post(url, data: body);

  Future<Response> put(String url, {dynamic body}) => dio.put(url, data: body);

  Future<Response> delete(String url, {dynamic body}) =>
      dio.delete(url, data: body);
}
