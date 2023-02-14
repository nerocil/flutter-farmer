import 'package:farmer_group_management/components/aside_bar.dart';
import 'package:farmer_group_management/components/navigation_menu.dart';
import 'package:farmer_group_management/controllers/aside_bar/aside_bar_controller.dart';
import 'package:farmer_group_management/controllers/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {

      final page = GetX<AsideBarController>(builder: (asideController) {
        return IndexedStack(
          index: asideController.activeMenu.value,
          children: List<Widget>.generate(
              NavigationMenu.navigationMenuList.length,
              (index) => NavigationMenu.navigationMenuList[index].page),
        );
      });

      if (constraints.maxWidth < 500) {
        controller.setLayoutState(layoutState: LayoutState.mobile);
        return mobileLayout(context, page);
      } else if (constraints.maxWidth < 1100) {
        controller.setLayoutState(layoutState: LayoutState.tablet);
        return tabletLayout(context, page);
      } else {
        controller.setLayoutState(layoutState: LayoutState.desktop);
        return desktopLayout(context, page);
      }
    });
  }


  Widget mobileLayout(BuildContext context, Widget page) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AsideBar(),
      body: page,
    );
  }

  Widget tabletLayout(BuildContext context, Widget page) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AsideBar(),
      body: page,
    );
  }

  Widget desktopLayout(BuildContext context, Widget page) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AsideBar(),
          Expanded(
            flex: 2,
            child: page,
          )
        ],
      ),
    );
  }
}
