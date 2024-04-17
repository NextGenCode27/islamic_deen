import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart';
import 'package:islamic_deen/core/exceptions/error.dart';
import 'package:islamic_deen/core/exceptions/server_exception.dart';
import 'package:islamic_deen/core/global/placemarks/data/datasource/remote/placemarks_remote_datasource.dart';
import 'package:islamic_deen/core/global/placemarks/domain/reposiotory/placemark_repository.dart';

class PlacemarksRepositoryImpl implements PlacemarkRepository {
  final PlacemarksRemoteDatasource placemarksRemoteDatasource;

  PlacemarksRepositoryImpl({required this.placemarksRemoteDatasource});
  @override
  Future<Either<Failure, List<Placemark>>> fetchPlacemarks() async {
    try {
      final List<Placemark> placemark =
          await placemarksRemoteDatasource.fetchPlacemarks();
      return right(placemark);
    } on ServerExcception catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
