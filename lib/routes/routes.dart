 import 'package:farmer_group_management/binding/home_binding.dart';
import 'package:farmer_group_management/middelware/auth_middleware.dart';
import 'package:farmer_group_management/pages/auth/login_page.dart';
import 'package:farmer_group_management/pages/home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteClass{
   static String home = "/";
   static String login = "/login";

   static String getHomeRoute() => home;
   static String getLoginRoute() => login;

   static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      middlewares: [
        AuthMiddleware(),
      ],
      binding: HomeBinding(),
    ),

     GetPage(
      name: login,
      page: () => LoginPage(),
    ),
 ];
 }