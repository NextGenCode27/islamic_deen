import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';

abstract interface class LocationPermissionRepository {
  Future<Either<Failure, bool>> locationPermissionHandler();
}
