import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';

abstract interface class SplashRepository {
  Future<Either<Failure, void>> initializeApp();
}
