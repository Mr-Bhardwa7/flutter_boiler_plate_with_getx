import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showErrorDialog(
      {String title = "Error", String description = "Something went wrong"}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(title, style: Get.textTheme.headline4),
          Text(description, style: Get.textTheme.headline6),
          ElevatedButton(
            onPressed: () {
              if (Get.isDialogOpen != null) Get.back();
            },
            child: Text("Okay"),
          )
        ]),
      ),
    ));
  }

  //show loading
  static void showLoding([String? message]) {
    Get.dialog(Dialog(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 8),
            Text(message ?? 'Loading...')
          ],
        ),
      ),
    ));
  }

  // hide loading
  static void hideLoading() {
    if (Get.isDialogOpen != null) Get.back();
  }
}
