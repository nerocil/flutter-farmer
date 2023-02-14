import 'package:farmer_group_management/components/active_status.dart';
import 'package:farmer_group_management/controllers/pages/group/croup_controller.dart';
import 'package:farmer_group_management/controllers/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class GroupsTable extends GetView<GroupController> {


  GroupsTable({Key? key, }) : super(key: key);

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 700),
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, right: 20, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Groups",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Row(
                        children: [
                          homeController.layoutState.value == LayoutState.desktop
                              ? SizedBox(
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    initialValue: "",
                                    decoration: const InputDecoration(
                                        isDense: true,
                                        hintText: "Search",
                                        labelText: "Search"),
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(width: homeController.layoutState.value == LayoutState.desktop ? 20 : 0),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              FeatherIcons.refreshCcw,
                              size: 14,
                            ),
                            label: const Text('Refresh'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text("Group name")),
                      DataColumn(label: Text("Creator")),
                      DataColumn(label: Text("Date created")),
                      DataColumn(label: Text("Status")),
                    ],
                    rows: List.generate(
                      controller.groups.value.groups?.length ?? 0,
                      (index) {
                        final group = controller.groups.value.groups![index];
                        return DataRow(
                          cells: [
                            DataCell(Text(group.name ?? "",maxLines: 1 ,overflow: TextOverflow.ellipsis,)),
                            DataCell(Text(group.createdBy?.fullName ?? "",maxLines: 1 ,overflow: TextOverflow.ellipsis,)),
                            DataCell(Text(group.createdAt?.readable ?? "",maxLines: 1 ,overflow: TextOverflow.ellipsis,)),
                            DataCell(ActiveStatus(isActive: group.active,)),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
