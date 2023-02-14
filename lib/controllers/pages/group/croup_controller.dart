import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer_group_management/models/groups.dart';
import 'package:farmer_group_management/services/app_http_service.dart';
import 'package:farmer_group_management/services/app_mixin.dart';
import 'package:get/get.dart';

class GroupController extends GetxController with AppMixin{

  final loading = false.obs;
  final groups = Groups().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    getGroups();
    super.onInit();
  }


  Future<void> getGroups()async{

    loading.value = true;
    final response = await Dio(AppHttpService.dioOption()).get('group').then((response) {

      return response;
    });

    if(response.statusCode == HttpStatus.ok){
      groups.value = Groups.fromJson(response.data);

    }

    // printDebug(message:response.data.toString());


    loading.value = false;
  }

}