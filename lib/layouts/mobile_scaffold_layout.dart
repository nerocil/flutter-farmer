import 'package:farmer_group_management/components/aside_bar.dart';
import 'package:farmer_group_management/layouts/page_navigator.dart';
import 'package:flutter/material.dart';

class MobileScaffoldLayout extends StatelessWidget {
  const MobileScaffoldLayout({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          appBar: AppBar(
            title: const Text("Group Manage"),
          ),
          drawer: AsideBar(),
          body:  Expanded(
            flex: 2,
            child: PageNavigator(isDesktop: true),
          )
      ),
    );
  }
}