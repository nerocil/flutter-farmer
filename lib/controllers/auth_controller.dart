import 'package:farmer_group_management/database/storage.dart';
import 'package:farmer_group_management/models/user.dart';
import 'package:farmer_group_management/services/app_mixin.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with AppMixin{

  final localStorage = Get.find<BoxStorage>();
  final user = User().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}