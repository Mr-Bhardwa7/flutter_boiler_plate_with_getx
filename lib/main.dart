import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/core/bindings/app_binding.dart';
import 'src/core/theme/app_theme.dart';
import 'src/routes/app_pages.dart';
import 'src/views/splashScreen/splash_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      initialBinding: AppBinding(),
      home: const SpalshScreen(),
      getPages: AppPages.pages,
      theme: appThemeData,
      defaultTransition: Transition.rightToLeftWithFade,
    );
  }
}
