import 'package:get_it/get_it.dart';
import 'package:islamic_deen/core/global/placemarks/data/datasource/remote/placemarks_remote_datasource.dart';
import 'package:islamic_deen/core/global/placemarks/data/repository/placemarks_repository_impl.dart';
import 'package:islamic_deen/core/global/placemarks/domain/reposiotory/placemark_repository.dart';
import 'package:islamic_deen/core/global/placemarks/domain/usecase/placemark_usecase.dart';
import 'package:islamic_deen/core/global/placemarks/presentation/bloc/placemark_bloc.dart';
import 'package:islamic_deen/core/permission/location_permission/data/data%20source/local/location_permission_local_datasource.dart';
import 'package:islamic_deen/core/permission/location_permission/data/repository/location_repository_permission_impl.dart';
import 'package:islamic_deen/core/permission/location_permission/domain/repository/location_permission_repository.dart';
import 'package:islamic_deen/core/permission/location_permission/domain/usecase/location_permission_usecase.dart';
import 'package:islamic_deen/core/permission/location_permission/presentation/bloc/location_permission_bloc.dart';
import 'package:islamic_deen/features/namaz/data/datasource/remote/namaz_remote_datasource.dart';
import 'package:islamic_deen/features/namaz/data/repository/namaz_repository_imp.dart';
import 'package:islamic_deen/features/namaz/domain/repository/namaz_repository.dart';
import 'package:islamic_deen/features/namaz/domain/usecase/namaz_timing_usecase.dart';
import 'package:islamic_deen/features/namaz/presentation/bloc/namaz_bloc.dart';
import 'package:islamic_deen/features/splash/data/data_source.dart/remote/splash_remote_datasource.dart';
import 'package:islamic_deen/features/splash/data/repository/splash_repository_impl.dart';
import 'package:islamic_deen/features/splash/domain/repository/splash_repository.dart';
import 'package:islamic_deen/features/splash/domain/usecase/initialize_app_usecase.dart';
import 'package:islamic_deen/features/splash/presentation/bloc/splash_bloc.dart';

final GetIt serviceLocatior = GetIt.instance;

Future<void> injectDependencies() async {
  _initSplash();
  _initLocationPermission();
  _initPlacemark();
  _namazTimingsInit();
}

_initSplash() {
  serviceLocatior
    ..registerFactory<SplashRemoteDatasource>(
      () => SplashRemoteDatasourceImpl(),
    )
    ..registerFactory<SplashRepository>(
      () => SplashRepositoryImpl(splashRemoteDatasource: serviceLocatior()),
    )
    ..registerFactory<InitializeAppUsecase>(
      () => InitializeAppUsecase(splashRepository: serviceLocatior()),
    )
    ..registerLazySingleton<SplashBloc>(
      () => SplashBloc(initializeAppUsecase: serviceLocatior()),
    );
}

_initLocationPermission() {
  serviceLocatior
    ..registerFactory<LocationPermissionLocalDatasource>(
      () => LocationPermissionLocalDatasourceImpl(),
    )
    ..registerFactory<LocationPermissionRepository>(
      () => LocationPermissionRepositoryImpl(
          locationLocalDatasource: serviceLocatior()),
    )
    ..registerFactory<LocationPermissionUsecase>(
      () => LocationPermissionUsecase(locationRepository: serviceLocatior()),
    )
    ..registerLazySingleton<LocationPermissionBloc>(
      () => LocationPermissionBloc(locationUsecase: serviceLocatior()),
    );
}

_initPlacemark() {
  serviceLocatior
    ..registerFactory<PlacemarksRemoteDatasource>(
      () => PlacemarksRemoteDatasourceImpl(),
    )
    ..registerFactory<PlacemarkRepository>(
      () => PlacemarksRepositoryImpl(
          placemarksRemoteDatasource: serviceLocatior()),
    )
    ..registerFactory<PlacemarksUsecase>(
      () => PlacemarksUsecase(placemarkRepository: serviceLocatior()),
    )
    ..registerLazySingleton<PlacemarkBloc>(
      () => PlacemarkBloc(placemarksUsecase: serviceLocatior()),
    );
}

_namazTimingsInit() {
  serviceLocatior
    ..registerFactory<NamazRemoteDatasource>(
      () => NamazRemoteDatasourceImpl(),
    )
    ..registerFactory<NamazRepository>(
      () => NamazRepositoryImpl(namazRemoteDatasource: serviceLocatior()),
    )
    ..registerFactory<NamazTimingUsecase>(
      () => NamazTimingUsecase(namazRepository: serviceLocatior()),
    )
    ..registerLazySingleton<NamazBloc>(
      () => NamazBloc(namazTimingUsecase: serviceLocatior()),
    );
}
