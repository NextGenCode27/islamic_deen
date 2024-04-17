import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamic_deen/core/exceptions/server_exception.dart';

abstract interface class PlacemarksRemoteDatasource {
  Future<List<Placemark>> fetchPlacemarks();
}

final class PlacemarksRemoteDatasourceImpl
    implements PlacemarksRemoteDatasource {
  @override
  Future<List<Placemark>> fetchPlacemarks() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      return placemarks;
    } on ServerExcception catch (e) {
      throw ServerExcception(message: e.message);
    }
  }
}
