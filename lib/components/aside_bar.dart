import 'package:farmer_group_management/components/aside_menu_item.dart';
import 'package:farmer_group_management/components/naviagation_menu.dart';
import 'package:flutter/material.dart';

class AsideBar extends StatelessWidget {
  const AsideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      child: Text("J"),
                    ),
                    title: Text("Joseph"),
                    subtitle: Text("Programmer"),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Admin tools",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: List.generate(
                        NavigationMenu.navigationMenuList.length, (index) {
                      final menu = NavigationMenu.navigationMenuList[index];
                      return AsideMenuItem(
                        onTap: () {},
                        index: index,
                        name: menu.name,
                        icon: menu.icon,
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(),
                  ),
                ],
              ),
            ),
          ),
          // Column(
          //   children: [
          //     AsideMenuItem(
          //         onTap: () {}, name: "Setting", icon: FeatherIcons.settings),
          //     const SizedBox(height: 4),
          //   ],
          // ),
        ],
      ),
    );
  }
}
