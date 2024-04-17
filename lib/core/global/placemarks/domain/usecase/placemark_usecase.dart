import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart';
import 'package:islamic_deen/core/exceptions/error.dart';
import 'package:islamic_deen/core/global/placemarks/domain/reposiotory/placemark_repository.dart';
import 'package:islamic_deen/core/usecase/usecase.dart';

class PlacemarksUsecase implements Usecase<List<Placemark>, NoParams> {
  final PlacemarkRepository placemarkRepository;

  PlacemarksUsecase({required this.placemarkRepository});
  @override
  Future<Either<Failure, List<Placemark>>> call(NoParams params) async {
    return await placemarkRepository.fetchPlacemarks();
  }
}
