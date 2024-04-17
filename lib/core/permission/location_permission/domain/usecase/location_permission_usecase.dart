import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';
import 'package:islamic_deen/core/permission/location_permission/domain/repository/location_permission_repository.dart';
import 'package:islamic_deen/core/usecase/usecase.dart';

class LocationPermissionUsecase implements Usecase<bool, NoParams> {
  final LocationPermissionRepository locationRepository;

  LocationPermissionUsecase({required this.locationRepository});
  @override
  Future<Either<Failure, bool>> call(params) async {
    return await locationRepository.locationPermissionHandler();
  }
}
