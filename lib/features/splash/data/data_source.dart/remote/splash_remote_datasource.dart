import 'package:islamic_deen/core/exceptions/server_exception.dart';

abstract interface class SplashRemoteDatasource {
  Future<void> initializeApp();
}

class SplashRemoteDatasourceImpl implements SplashRemoteDatasource {
  @override
  Future<void> initializeApp() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
    } on ServerExcception catch (e) {
      throw ServerExcception(message: e.message);
    }
  }
}
