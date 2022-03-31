import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/utilities/dailog_helper.dart';
import 'package:flutter_skeleton/src/services/permission_sevice.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'base_controller.dart';

class PermissionController extends GetxController with BaseController {
  int _cameraRequestedCount = 0;

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    //TODO: Move this permisison as per your requirement
    // check permission on app load
    await checkCameraPermission(onGranted: () {
      //TODO: Add your logic here
      print("Granted Camera Permission");
    });
    super.onInit();
  }

  /* Camera Permisison Sample Function */
  Future<void> checkCameraPermission(
      {required final OnGranted onGranted}) async {
    await GrantPermissionCamera().request(
      onPermatentlyDenied: () async {
        //TODO: launch dialog, make user go to app settings
        print("Granted Camera Denied");
        await openAppSettings();
      },
      onGranted: onGranted,
      requestedCount: _cameraRequestedCount,
    );
    _cameraRequestedCount = _cameraRequestedCount + 1;
  }

  /* Microphone and Stroage (Multiple Permision) Sample */
  Future<void> checkMicrophoneAndStroagePermisison(
      {required final OnGranted onGranted,
      required final BuildContext context}) async {
    await GrantMultiplePermissions().request(onCallback: (statuses) {
      /* Hanlde permission decline state */
      if (statuses[Permission.microphone] ==
              PermissionStatus.permanentlyDenied &&
          statuses[Permission.storage] == PermissionStatus.permanentlyDenied) {
        DialogHelper.showPermissionDeniedPopup(
            context: context,
            message:
                'Please provide microphone and stroage permission to continue audio recording, provide access from setting',
            title: 'Multiple permission Required');
      } else if (statuses[Permission.microphone] ==
          PermissionStatus.permanentlyDenied) {
        DialogHelper.showPermissionDeniedPopup(
            context: context,
            message:
                'Please provide microphone permission to continue audio recording, provide access from setting',
            title: 'Microphone permission Required');
      } else if (statuses[Permission.storage] ==
          PermissionStatus.permanentlyDenied) {
        DialogHelper.showPermissionDeniedPopup(
            context: context,
            message:
                'Please provide stroage permission to continue audio recording, provide access from setting',
            title: 'Stroage permission Required');
      }

      /* Handle permisison granted state */
      if ((statuses[Permission.microphone] == PermissionStatus.granted ||
              statuses[Permission.microphone] == PermissionStatus.limited) &&
          (statuses[Permission.storage] == PermissionStatus.granted ||
              statuses[Permission.storage] == PermissionStatus.limited)) {
        onGranted();
      }
    });
  }
}

/* Single Permisison Request Sample  */
class GrantPermissionCamera extends GrantPermissionService {
  GrantPermissionCamera() : super(Permission.camera);
}

class GrantPermissionPhotos extends GrantPermissionService {
  GrantPermissionPhotos()
      : super(Platform.isAndroid ? Permission.storage : Permission.photos);
}

/* Multiple Permisison Request Sample */
class GrantMultiplePermissions extends GrantMultiplePermissionService {
  GrantMultiplePermissions()
      : super([Permission.microphone, Permission.storage]);
}
