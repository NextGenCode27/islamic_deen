import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:islamic_deen/core/global/placemarks/domain/usecase/placemark_usecase.dart';
import 'package:islamic_deen/core/usecase/usecase.dart';

part 'placemark_event.dart';
part 'placemark_state.dart';

class PlacemarkBloc extends Bloc<PlacemarkEvent, PlacemarkState> {
  final PlacemarksUsecase _placemarksUsecase;
  PlacemarkBloc({required PlacemarksUsecase placemarksUsecase})
      : _placemarksUsecase = placemarksUsecase,
        super(PlacemarkInitial()) {
    on<PlacemarkEvent>(_mapPlacemarkEvent);
    on<FetchPlacemarkEvent>(_mapFetchPlacemarkEvent);
  }

  FutureOr<void> _mapPlacemarkEvent(
      PlacemarkEvent event, Emitter<PlacemarkState> emit) async {
    emit(PlacemarkLoading());
  }

  FutureOr<void> _mapFetchPlacemarkEvent(
      FetchPlacemarkEvent event, Emitter<PlacemarkState> emit) async {
    final res = await _placemarksUsecase.call(NoParams());

    res.fold(
      (error) => emit(PlacemarkFailed(message: error.message)),
      (placemark) => emit(PlacemarkSuccess(placemark: placemark)),
    );
  }
}
