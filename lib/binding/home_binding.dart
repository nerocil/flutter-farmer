import 'package:farmer_group_management/controllers/aside_bar/aside_bar_controller.dart';
import 'package:farmer_group_management/controllers/pages/cultivation/cultivation_page_controller.dart';
import 'package:farmer_group_management/controllers/pages/dashboard/dashboard_page_controller.dart';
import 'package:farmer_group_management/controllers/pages/group/croup_controller.dart';
import 'package:farmer_group_management/controllers/pages/profile/profile_page_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardPageController());
    Get.lazyPut(() => CultivationPageController());
    Get.lazyPut(() => GroupController());
    Get.lazyPut(() => ProfilePageController());
  }

}