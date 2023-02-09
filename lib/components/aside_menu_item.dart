import 'package:farmer_group_management/controllers/aside_bar/aside_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsideMenuItem extends GetView<AsideBarController> {
  final Function() onTap;
  final IconData icon;
  final String name;
  final int index;
  final double marginButton;

  const AsideMenuItem({ required this.index,
    Key? key,
    required this.onTap,
    required this.name,
    required this.icon,
    this.marginButton = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  color: controller.activeMenu.value == index ?
                  Theme.of(context).splashColor:Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    hoverColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    onTap: (){
                      controller.activeMenu.value = index;
                      onTap();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: marginButton),
              ],
            );
      }
    );
    }
}
