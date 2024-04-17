import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';
import 'package:islamic_deen/core/exceptions/server_exception.dart';
import 'package:islamic_deen/features/namaz/data/datasource/remote/namaz_remote_datasource.dart';
import 'package:islamic_deen/features/namaz/domain/entity/namaz_entity.dart';
import 'package:islamic_deen/features/namaz/domain/repository/namaz_repository.dart';

class NamazRepositoryImpl implements NamazRepository {
  final NamazRemoteDatasource namazRemoteDatasource;

  NamazRepositoryImpl({required this.namazRemoteDatasource});
  @override
  Future<Either<Failure, NamazEntity>> fetchNamazTiming({
    required String city,
    required String country,
  }) async {
    try {
      final namazTime = await namazRemoteDatasource.fetchNamazTime(
          city: city, country: country);
      return right(namazTime!);
    } on ServerExcception catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
