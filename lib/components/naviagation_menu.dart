

import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class NavigationMenu{

  final String name;
  final IconData icon;
  NavigationMenu({required this.name, required this.icon});

  static List<NavigationMenu> get navigationMenuList  => [
    NavigationMenu(name: "Dashboard", icon: FeatherIcons.monitor),
    NavigationMenu(name: "Groups", icon: FeatherIcons.users),
    NavigationMenu(name: "Profile", icon: FeatherIcons.user),
  ];
}
