import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
