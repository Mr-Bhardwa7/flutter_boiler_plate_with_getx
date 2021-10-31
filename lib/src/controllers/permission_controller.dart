import 'dart:io';

import 'package:flutter_skeleton/src/services/permission_sevice.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'base_controller.dart';

class PermissionController extends GetxController with BaseController {
  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    // check permission on app load
    await checkCameraPermission(onGranted: () {
      print("Granted Camera Permission");
    });
    super.onInit();
  }

  Future<void> checkCameraPermission(
      {required final OnGranted onGranted}) async {
    await GrantPermissionCamera().request(
        onPermatentlyDenied: () async {
          // launch dialog, make user go to app settings
          print("Granted Camera Denied");
          await openAppSettings();
        },
        onGranted: onGranted);
  }
}

class GrantPermissionCamera extends GrantPermissionService {
  GrantPermissionCamera() : super(Permission.camera);
}

class GrantPermissionPhotos extends GrantPermissionService {
  GrantPermissionPhotos()
      : super(Platform.isAndroid ? Permission.storage : Permission.photos);
}
