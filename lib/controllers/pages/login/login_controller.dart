import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer_group_management/controllers/aside_bar/aside_bar_controller.dart';
import 'package:farmer_group_management/controllers/auth_controller.dart';
import 'package:farmer_group_management/models/user.dart';
import 'package:farmer_group_management/routes/routes.dart';
import 'package:farmer_group_management/services/app_http_service.dart';
import 'package:farmer_group_management/services/app_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with AppMixin {
  final authController = Get.find<AuthController>();
  final loading = false.obs;

  final passcode = "".obs;
  final userName = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onAttemptLogin() async {
    loading.value = true;
    final response = await Dio(AppHttpService.dioOption()).post('login',
        data: {"password": passcode.value, "email": userName.value});


    if (response.statusCode == HttpStatus.ok) {
      Get.find<AsideBarController>().activeMenu.value = 0;

      printDebug(message: response.data.toString());
      final user = User.fromJson(response.data);

      await authController.localStorage.storeUser(user);

      authController.user.value = user;
      printDebug(message: authController.user.value.token);
      passcode.value = "";
      userName.value = "";
      loading.value = false;
      Get.offAllNamed(RouteClass.home);

    } else {
      printDebug(message: response.data.toString());
      errorMessage(message: "Login not success");

    }
    loading.value = false;
  }
}
