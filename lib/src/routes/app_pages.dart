import 'package:flutter_skeleton/src/views/home/home_page.dart';
import 'package:flutter_skeleton/src/views/splashScreen/splash_screen.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SpalshScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
  ];
}
