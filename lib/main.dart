
import 'package:farmer_group_management/controllers/aside_bar/aside_bar_controller.dart';
import 'package:farmer_group_management/controllers/auth_controller.dart';
import 'package:farmer_group_management/database/storage.dart';
import 'package:farmer_group_management/routes/routes.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/pages/home/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(BoxStorage()).initStorage();
  Get.put(AuthController());
  Get.put(HomeController());
  Get.put(AsideBarController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Group Management',
      debugShowCheckedModeBanner: false,
      // This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff1145a4),
          primaryContainer: Color(0xff9fb4da),
          secondary: Color(0xff4400f8),
          secondaryContainer: Color(0xffe1a4a4),
          tertiary: Color(0xff376bca),
          tertiaryContainer: Color(0xffcfdbf2),
          appBarColor: Color(0xffcfdbf2),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 9,
       // scaffoldBackground: Colors.white,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          elevatedButtonRadius: 12.0,
          elevatedButtonSchemeColor: SchemeColor.onSecondary,
          elevatedButtonSecondarySchemeColor: SchemeColor.secondary,
          // outlinedButtonSchemeColor: SchemeColor.secondary,
          // outlinedButtonOutlineSchemeColor: SchemeColor.secondary,
          outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          outlinedButtonOutlineSchemeColor: SchemeColor.outline,
          toggleButtonsRadius: 12.0,
          inputDecoratorSchemeColor: SchemeColor.tertiary,
          inputDecoratorIsFilled: false,
          inputDecoratorRadius: 12.0,
          chipRadius: 24.0,
          popupMenuRadius: 12.0,
          navigationBarBackgroundSchemeColor: SchemeColor.onPrimary,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xffbbcae5),
          primaryContainer: Color(0xff577cbf),
          secondary: Color(0xff9278ff),
          secondaryContainer: Color(0xffcb6060),
          tertiary: Color(0xffdde5f5),
          tertiaryContainer: Color(0xff7297d9),
          appBarColor: Color(0xffdde5f5),
          error: null,
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
       // scaffoldBackground: Colors.black54,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          elevatedButtonRadius: 12.0,
          elevatedButtonSchemeColor: SchemeColor.onSecondary,
          elevatedButtonSecondarySchemeColor: SchemeColor.secondary,
          // outlinedButtonSchemeColor: SchemeColor.secondary,
          // outlinedButtonOutlineSchemeColor: SchemeColor.secondary,
          outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          outlinedButtonOutlineSchemeColor: SchemeColor.outline,
          toggleButtonsRadius: 12.0,
          inputDecoratorIsFilled: false,
          inputDecoratorRadius: 12.0,
          chipRadius: 24.0,
          popupMenuRadius: 12.0,
          navigationBarBackgroundSchemeColor: SchemeColor.onPrimary,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

      //unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      initialRoute: RouteClass.getHomeRoute(),
      getPages: RouteClass.routes,

      // home: AppLayout(
      //   mobileScaffoldLayout: MobileScaffoldLayout(),
      //   tabletScaffoldLayout: TabletScaffoldLayout(),
      //   desktopScaffoldLayout: DesktopScaffoldLayout(),
      // ),
    );
  }
}
