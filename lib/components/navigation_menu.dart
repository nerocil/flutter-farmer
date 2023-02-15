

import 'package:farmer_group_management/components/group_table.dart';
import 'package:farmer_group_management/pages/cultivation/cultivation_page.dart';
import 'package:farmer_group_management/pages/dashboard/dashboard_page.dart';
import 'package:farmer_group_management/pages/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class NavigationMenu{

  final String name;
  final IconData icon;
  final Widget page;
  NavigationMenu({required this.name, required this.icon, required this.page});

  static List<NavigationMenu> get navigationMenuList  => [
    NavigationMenu(name: "Dashboard", icon: FeatherIcons.monitor,page: const DashboardPage()),
    NavigationMenu(name: "Cultivation Details", icon: FeatherIcons.list,page:const CultivationPage()),
    NavigationMenu(name: "Groups", icon: FeatherIcons.users,page: GroupsTable()),
    NavigationMenu(name: "Profile", icon: FeatherIcons.user,page: ProfilePage()),
  ];
}
