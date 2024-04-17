import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart';
import 'package:islamic_deen/core/exceptions/error.dart';

abstract interface class PlacemarkRepository {
  Future<Either<Failure, List<Placemark>>> fetchPlacemarks();
}
