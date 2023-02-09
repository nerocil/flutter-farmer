import 'package:farmer_group_management/components/group_table.dart';
import 'package:farmer_group_management/controllers/aside_bar/aside_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNavigator extends StatelessWidget {
  final bool isDesktop;
  PageNavigator({Key? key, required this.isDesktop}) : super(key: key);
   

  final asideController = Get.find<AsideBarController>();

  @override
  Widget build(BuildContext context) {
    return Obx( () {
              return IndexedStack(
                index: asideController.activeMenu.value,
                children: [
                  Center(child: Text("Dashboard"),),
                  GroupsTable(isDesktop: isDesktop,),
                  Center(child: Text("Profile"),),
                ],
              );
            }
    );
  }
}
