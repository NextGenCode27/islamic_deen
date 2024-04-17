import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_deen/core/usecase/usecase.dart';
import 'package:islamic_deen/features/splash/domain/usecase/initialize_app_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final InitializeAppUsecase _initializeAppUsecase;
  SplashBloc({required InitializeAppUsecase initializeAppUsecase})
      : _initializeAppUsecase = initializeAppUsecase,
        super(SplashInitial()) {
    on<SplashEvent>(_mapSplashEventToState);
    on<InitializeAppEvent>(_mapInitializeAppEventToState);
  }

  FutureOr<void> _mapSplashEventToState(
      SplashEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
  }

  FutureOr<void> _mapInitializeAppEventToState(
      InitializeAppEvent event, Emitter<SplashState> emit) async {
    final res = await _initializeAppUsecase.call(NoParams());
    res.fold(
      (error) => emit(SplashFailed(message: error.message)),
      (noReturns) => emit(SplashSuccess()),
    );
  }
}
