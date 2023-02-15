import 'package:farmer_group_management/controllers/auth_controller.dart';
import 'package:farmer_group_management/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware{

  final authController = Get.find<AuthController>();
  @override
  RouteSettings? redirect(String? route) {
    if(authController.user.value.token == null){
      return RouteSettings(name: RouteClass.login);
    }
    return null;
  }

// @override
// GetPage? onPageCalled(GetPage? page) => page;
//
// @override
// List<Bindings>? onBindingsStart(List<Bindings>? bindings) => bindings;
//
// @override
// GetPageBuilder? onPageBuildStart(GetPageBuilder? page) => page;
//
// @override
// Widget onPageBuilt(Widget page) => page;

}