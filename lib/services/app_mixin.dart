import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

mixin AppMixin {

  printDebug({String ?message}){
    if (kDebugMode) {
      print("========>> $message");
    }
  }

  void successMessage({required String message}){
    Get.snackbar(
      "Success!",
      message,
      backgroundColor: Colors.green[100],
      colorText: Colors.green,
      borderRadius: 5,
      margin: const EdgeInsets.all(8),
      icon: const Icon(Icons.check,color:Colors.green),
      snackPosition: SnackPosition.TOP,
    );
  }

  void infoMessage({required String message}){
    Get.snackbar(
      "Info!",
      message,
      backgroundColor: Colors.blueGrey[100],
      colorText: Colors.blueGrey,
      borderRadius: 5,
      margin: const EdgeInsets.all(8),
      icon: const Icon(FeatherIcons.info,color:Colors.blueGrey),
      snackPosition: SnackPosition.TOP,
    );
  }

  void errorMessage({required String message}){
    Get.snackbar(
      "Oops!",
      message,
      backgroundColor: Colors.red[100],
      colorText: Colors.red,
      borderRadius: 5,
      margin: const EdgeInsets.all(8),
      icon: const Icon(FeatherIcons.info,color:Colors.red),
      snackPosition: SnackPosition.TOP,
    );
  }
}