import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';
import 'package:islamic_deen/core/exceptions/server_exception.dart';
import 'package:islamic_deen/features/splash/data/data_source.dart/remote/splash_remote_datasource.dart';
import 'package:islamic_deen/features/splash/domain/repository/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashRemoteDatasource splashRemoteDatasource;

  SplashRepositoryImpl({required this.splashRemoteDatasource});
  @override
  Future<Either<Failure, void>> initializeApp() async {
    try {
      final app = await splashRemoteDatasource.initializeApp();
      return right(app);
    } on ServerExcception catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
