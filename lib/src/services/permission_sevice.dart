import 'package:permission_handler/permission_handler.dart';

abstract class GrantPermissionService {
  final Permission permission;

  GrantPermissionService(this.permission);

  Future<void> request({
    required final OnPermatentlyDenied onPermatentlyDenied,
    required final OnGranted onGranted,
  }) async {
    PermissionStatus status = await permission.status;
    // ignore: avoid_print
    print("GrantPermissionService status: $status");
    if (status.isPermanentlyDenied) {
      onPermatentlyDenied.call();
      return;
    }
    if (!status.isLimited && !status.isGranted) {
      final PermissionStatus result = await permission.request();
      if (!result.isGranted) {
        return;
      }
    }
    onGranted.call();
  }
}

typedef OnPermatentlyDenied = void Function();

typedef OnGranted = void Function();
