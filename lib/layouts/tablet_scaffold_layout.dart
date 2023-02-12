import 'package:farmer_group_management/components/aside_bar.dart';
import 'package:farmer_group_management/layouts/page_navigator.dart';
import 'package:flutter/material.dart';

class TabletScaffoldLayout extends StatelessWidget {
  const TabletScaffoldLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group Manage"),
      ),
        drawer: AsideBar(),
      body:  PageNavigator(isDesktop: false),
    );
  }
}
