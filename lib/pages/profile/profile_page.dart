import 'package:farmer_group_management/components/detail_card.dart';
import 'package:farmer_group_management/components/progress_button.dart';
import 'package:farmer_group_management/components/settign_item.dart';
import 'package:farmer_group_management/components/setting_card.dart';
import 'package:farmer_group_management/controllers/auth_controller.dart';
import 'package:farmer_group_management/controllers/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          SettingCard(
            title: "Account",
            content: Column(
              children: [
                SettingItem(
                  leading: const Icon(
                    FeatherIcons.user,
                    size: 20,
                  ),
                  title: Text(authController.user.value.firstName ?? "", style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(authController.user.value.email ?? ""),
                ),
                const SizedBox(height: 20),
                SettingItem(
                  leading: const Icon(FeatherIcons.layers, size: 20),
                  title: Text("Region", style: Theme.of(context).textTheme.titleMedium),
                  subtitle: const Text('Arusha'),
                ),
                const SizedBox(height: 20),
                SettingItem(
                  onTap: () {
                    Get.bottomSheet(
                      Obx(() {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(width: 380,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  DetailCard(
                                    title: "Are you sure you would like to log out?",

                                    body: Container(),
                                    footer:Column(
                                      children: [
                                        ProgressButton(
                                            color: Colors.redAccent,
                                            name: "Log out from all devices",
                                            loading: authController.loading.value,
                                            onPress: () {
                                              authController.logout(fromAll: true);
                                              Get.back();
                                            }),
                                        const SizedBox(height: 10),
                                        ProgressButton(
                                            name: "Log out from this device",
                                            loading: authController.loading.value,
                                            onPress: () {
                                              authController.logout(fromAll: false);
                                              Get.back();
                                            }),
                                        const SizedBox(height: 10),
                                        SizedBox(width:double.infinity,child: OutlinedButton(onPressed: (){Get.back();}, child: const Text("Cancel"))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      ),
                      elevation: 0,
                      //backgroundColor: Colors.white,
                    );
                  },
                  leading: const Icon(
                    FeatherIcons.logOut,
                    size: 20,
                  ),
                  title: Text("Logout", style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(
                    authController.user.value.email ?? "",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  actionLeading: FeatherIcons.chevronRight,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SettingCard(
            title: "Settings",
            content: Column(
              children: [

                SettingItem(
                  leading: const Icon(FeatherIcons.refreshCw, size: 20),
                  title: Text("Refresh App values", style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text("Check for default values eg. Regions", style: Theme.of(context).textTheme.caption),

                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SettingCard(
            title: "App Info",
            content: Column(
              children: [
                SettingItem(
                  leading: const Icon(FeatherIcons.gitPullRequest, size: 20),
                  title: Text("Developer", style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text("Joseph Prosper, uissojoseph@gmail.com", style: Theme.of(context).textTheme.caption),

                ),

                const SizedBox(height: 20),
                SettingItem(
                  leading: const Icon(FeatherIcons.info, size: 20),
                  title: Text("Privacy Policy", style: Theme.of(context).textTheme.titleMedium),

                ),
                const SizedBox(height: 20),
                SettingItem(
                  leading: const Icon(FeatherIcons.alignJustify, size: 20),
                  title: Text("Licence", style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text('Licences, App, Version', style: Theme.of(context).textTheme.caption),
                  actionLeading: FeatherIcons.chevronRight,
                  onTap: () async {
                    final packageInfo = await PackageInfo.fromPlatform();
                    showAboutDialog(
                      context: context,
                      applicationIcon: const Icon(FeatherIcons.monitor),
                      applicationName:"Farmer Manager" ,//packageInfo.appName,
                      applicationVersion: "${packageInfo.version} (${packageInfo.buildNumber})",
                      applicationLegalese: "App for tracking farmer cultivation detail, and manage groups",
                    );
                  },
                ),
              ],
            ),
          ),
        ],),
      ),
    );
  }
}
