import 'package:flutter_skeleton/src/controllers/permission_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PermissionController>(PermissionController());
  }
}
