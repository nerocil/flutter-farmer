import 'package:dio/dio.dart';

class AppHttpService{

  // static const String baseUrl = "http://155.12.53.227/api/v1/";
  // static const String imageUrl = "http://155.12.53.227/api/v1";
  static const String imageUrl = "http://127.0.0.1:8000/";
  static const String baseUrl = "http://127.0.0.1:8000/api/";

  static BaseOptions dioOption({String? url}) {
    final token = null;
    BaseOptions options = BaseOptions(
      baseUrl: url??baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 65000,
      receiveTimeout: 65000,
      followRedirects: false,
      validateStatus: (status) {
        return status! < 501; //todo change to 500 on production
      },
      headers: {
        Headers.acceptHeader: Headers.jsonContentType,
        Headers.contentTypeHeader: Headers.jsonContentType,
        // 'Content-Type': 'multipart/form-data',
        "Authorization": "Bearer $token",
        "version": "1.0.0"
        // todo in future we may need this for check app version for
        //  notify user if app update needed
      },
    );
    return options;
  }
}