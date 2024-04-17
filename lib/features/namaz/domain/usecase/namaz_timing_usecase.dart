import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';
import 'package:islamic_deen/core/usecase/usecase.dart';
import 'package:islamic_deen/features/namaz/domain/entity/namaz_entity.dart';
import 'package:islamic_deen/features/namaz/domain/repository/namaz_repository.dart';

class NamazTimingUsecase implements Usecase<NamazEntity, NamazTimingParams> {
  final NamazRepository namazRepository;

  NamazTimingUsecase({required this.namazRepository});
  @override
  Future<Either<Failure, NamazEntity>> call(NamazTimingParams params) async {
    return await namazRepository.fetchNamazTiming(
        city: params.city, country: params.country);
  }
}

class NamazTimingParams {
  final String city;
  final String country;

  NamazTimingParams({
    required this.city,
    required this.country,
  });
}
