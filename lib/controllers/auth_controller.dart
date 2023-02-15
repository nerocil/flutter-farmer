import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer_group_management/database/storage.dart';
import 'package:farmer_group_management/models/user.dart';
import 'package:farmer_group_management/routes/routes.dart';
import 'package:farmer_group_management/services/app_http_service.dart';
import 'package:farmer_group_management/services/app_mixin.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with AppMixin{

  final loading = false.obs;
  final localStorage = Get.find<BoxStorage>();
  final user = User().obs;


  @override
  void onInit() {
    user.value = localStorage.getUser();
    printDebug(message: user.value.email??"User not found");
    super.onInit();
  }


  logout({required bool fromAll})async{
    loading.value = true;
    final response = await Dio(AppHttpService.dioOption()).post('logout',
        data: {"option": fromAll?'all':null});


    if (response.statusCode == HttpStatus.ok) {
      printDebug(message: response.data.toString());
      final user = User.fromJson(response.data);

      await localStorage.removeUser();

      loading.value = false;
      successMessage(message: "Your just logout");
    }
    Get.offAllNamed(RouteClass.login);
    printDebug(message: response.data.toString());
    loading.value = false;
  }



}