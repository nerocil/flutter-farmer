import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer_group_management/models/dashbaord.dart';
import 'package:farmer_group_management/services/app_http_service.dart';
import 'package:farmer_group_management/services/app_mixin.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController with AppMixin {
  final loading = false.obs;
  final dashboard = Dashboard().obs;
  final selectedRegion = "Arusha".obs;
  final selectedProduct = "Alizeti".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getDashboardData();
    super.onInit();
  }

  Future<void> getDashboardData() async {
    loading.value = true;
    final response = await Dio(AppHttpService.dioOption()).get('dashboard',
        queryParameters: {
          "region": selectedRegion.value,
          "product": selectedProduct.value
        }).then((response) => response);

    if (response.statusCode == HttpStatus.ok) {
      dashboard.value = Dashboard.fromJson(response.data);
    }else{
      printDebug(message: response.data.toString());
    }



    loading.value = false;
  }

  onSelectRegion(String regionName) {
    selectedRegion.value = regionName;
    getDashboardData();
  }

  onSelectProduct(String regionName) {
    selectedProduct.value = regionName;
    getDashboardData();
  }
}
