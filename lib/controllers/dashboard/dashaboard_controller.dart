import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer_group_management/models/dashbard.dart';
import 'package:farmer_group_management/services/app_http_service.dart';
import 'package:farmer_group_management/services/app_mixin.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController with AppMixin {

  final loading = false.obs;
  final dashboard = Dashboard().obs;
  
  
  @override
  void onInit() {
    // TODO: implement onInit
    getDashboardData();
    super.onInit();
  }
  
  Future<void> getDashboardData() async{
    loading.value =true;
    final response = await Dio(AppHttpService.dioOption()).get('dashboard').then((response) => response);

    if(response.statusCode == HttpStatus.ok){
      dashboard.value = Dashboard.fromJson(response.data);
    }

    printDebug(message:response.data.toString());

    loading.value = false;
    
  }
  
}