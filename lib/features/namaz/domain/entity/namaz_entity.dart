import 'package:islamic_deen/features/namaz/data/model/namaz_model.dart';

abstract class NamazEntity {
  final int? code;
  final String? status;
  final Data? data;

  NamazEntity({
    required this.code,
    required this.status,
    required this.data,
  });
}
