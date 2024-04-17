import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';
import 'package:islamic_deen/core/exceptions/server_exception.dart';
import 'package:islamic_deen/core/permission/location_permission/data/data%20source/local/location_permission_local_datasource.dart';
import 'package:islamic_deen/core/permission/location_permission/domain/repository/location_permission_repository.dart';

class LocationPermissionRepositoryImpl implements LocationPermissionRepository {
  final LocationPermissionLocalDatasource locationLocalDatasource;

  LocationPermissionRepositoryImpl({required this.locationLocalDatasource});
  @override
  Future<Either<Failure, bool>> locationPermissionHandler() async {
    try {
      final locationService =
          await locationLocalDatasource.locationPermissionHandler();
      return right(locationService);
    } on ServerExcception catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
