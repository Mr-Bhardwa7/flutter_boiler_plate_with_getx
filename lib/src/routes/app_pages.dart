import 'package:get/get.dart';
import 'package:voice_split/src/views/home/home_page.dart';
import 'package:voice_split/src/views/splashScreen/splash_screen.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SpalshScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
  ];
}
