import 'package:farmer_group_management/components/aside_bar.dart';
import 'package:farmer_group_management/controllers/aside_bar/aside_bar_controller.dart';
import 'package:farmer_group_management/layouts/page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopScaffoldLayout extends StatelessWidget {
  DesktopScaffoldLayout({Key? key}) : super(key: key);

final asideController = Get.find<AsideBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AsideBar(),
          Expanded(
            flex: 2,
            child: PageNavigator(isDesktop: false),
          )
        ],
      ),
    );
  }
}




