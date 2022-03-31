import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

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

/* Permisison Declined - open setting  */
  static void showPermissionDeniedPopup(
      {required BuildContext context,
      required String title,
      required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            softWrap: true,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          elevation: 50.0,
          scrollable: true,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("Setting"),
              onPressed: () async {
                await openAppSettings();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
