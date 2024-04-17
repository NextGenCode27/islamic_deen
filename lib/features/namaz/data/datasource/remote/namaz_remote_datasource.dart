import 'package:dio/dio.dart';
import 'package:islamic_deen/core/exceptions/server_exception.dart';
import 'package:islamic_deen/features/namaz/data/model/namaz_model.dart';

abstract interface class NamazRemoteDatasource {
  Future<NamazModel?> fetchNamazTime(
      {required String city, required String country});
}

class NamazRemoteDatasourceImpl implements NamazRemoteDatasource {
  @override
  Future<NamazModel?> fetchNamazTime(
      {required String city, required String country}) async {
    final Dio dio = Dio();
    try {
      final response = await dio.get(
          'https://api.aladhan.com/v1/timingsByCity?city=Dubai&country=United+Arab+Emirates&method=8');

      if (response.statusCode == 200) {
        final data = NamazModel.fromJson(response.data);
        return data;
      }
      return null;
    } on ServerExcception catch (e) {
      throw ServerExcception(message: e.message);
    }
  }
}
