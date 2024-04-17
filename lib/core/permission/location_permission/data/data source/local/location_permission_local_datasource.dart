import 'package:islamic_deen/core/exceptions/server_exception.dart';
import 'package:permission_handler/permission_handler.dart';

abstract interface class LocationPermissionLocalDatasource {
  Future<bool> locationPermissionHandler();
}

class LocationPermissionLocalDatasourceImpl
    implements LocationPermissionLocalDatasource {
  @override
  Future<bool> locationPermissionHandler() async {
    const permission = Permission.location;
    try {
      if (await permission.isDenied) {
        await permission.request();
      }
      if (await permission.isPermanentlyDenied) {
        return await openAppSettings();
      }
      return permission.isGranted;
    } on ServerExcception catch (e) {
      throw ServerExcception(message: e.message);
    }
  }
}
