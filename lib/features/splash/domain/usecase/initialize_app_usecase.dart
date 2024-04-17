import 'package:fpdart/fpdart.dart';
import 'package:islamic_deen/core/exceptions/error.dart';
import 'package:islamic_deen/core/usecase/usecase.dart';
import 'package:islamic_deen/features/splash/domain/repository/splash_repository.dart';

class InitializeAppUsecase implements Usecase<void, NoParams> {
  final SplashRepository splashRepository;

  InitializeAppUsecase({required this.splashRepository});
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await splashRepository.initializeApp();
  }
}
