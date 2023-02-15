import 'package:dio/dio.dart';
import 'package:farmer_group_management/database/storage.dart';
import 'package:get/get.dart';

class AppHttpService{

  static const String imageUrl = "https://farmer-api.wiampro.co.tz/";
  static const String baseUrl = "https://farmer-api.wiampro.co.tz/v1/";

  static BaseOptions dioOption({String? url}) {
    final database = Get.find<BoxStorage>();
    final token = database.getUser().token;
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