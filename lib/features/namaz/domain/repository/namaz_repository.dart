import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';
import 'package:islamic_deen/features/namaz/domain/entity/namaz_entity.dart';

abstract interface class NamazRepository {
  Future<Either<Failure, NamazEntity>> fetchNamazTiming(
      {required String city, required String country});
}
