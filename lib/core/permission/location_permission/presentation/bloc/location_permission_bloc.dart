import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_deen/core/permission/location_permission/domain/usecase/location_permission_usecase.dart';
import 'package:islamic_deen/core/usecase/usecase.dart';

part 'location_permission_event.dart';
part 'location_permission_state.dart';

class LocationPermissionBloc
    extends Bloc<LocationPermissionEvent, LocationPermissionState> {
  final LocationPermissionUsecase _locationUsecase;
  LocationPermissionBloc({required LocationPermissionUsecase locationUsecase})
      : _locationUsecase = locationUsecase,
        super(LocationPermissionInitial()) {
    on<LocationPermissionEvent>(_mapLocationEventToState);

    on<IsLocatedLocationPermissionEvent>(_mapIsLocatedLocationEventToState);
  }

  FutureOr<void> _mapLocationEventToState(LocationPermissionEvent event,
      Emitter<LocationPermissionState> emit) async {
    emit(LocationPermissionLoading());
  }

  FutureOr<void> _mapIsLocatedLocationEventToState(
      IsLocatedLocationPermissionEvent event,
      Emitter<LocationPermissionState> emit) async {
    final res = await _locationUsecase.call(NoParams());
    res.fold(
      (error) => emit(LocationFailed(message: error.message)),
      (location) => emit(LocationPermissionSuccess(location: location)),
    );
  }
}
