import 'package:farmer_group_management/services/app_mixin.dart';
import 'package:get/get.dart';

enum LayoutState  {mobile,tablet,desktop}
class HomeController extends GetxController with AppMixin{

  final layoutState = LayoutState.desktop.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  setLayoutState({required LayoutState layoutState}){
    this.layoutState.value = layoutState;
    printDebug(message: "Changes ${this.layoutState.value}");
  }


}