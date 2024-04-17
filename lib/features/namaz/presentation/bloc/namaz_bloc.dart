import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_deen/features/namaz/domain/entity/namaz_entity.dart';
import 'package:islamic_deen/features/namaz/domain/usecase/namaz_timing_usecase.dart';

part 'namaz_event.dart';
part 'namaz_state.dart';

class NamazBloc extends Bloc<NamazEvent, NamazState> {
  final NamazTimingUsecase _namazTimingUsecase;
  NamazBloc({required NamazTimingUsecase namazTimingUsecase})
      : _namazTimingUsecase = namazTimingUsecase,
        super(NamazInitial()) {
    on<NamazEvent>(_mapNamazEventToState);
    on<FetchNamazTimingEvent>(_mapFetchNamazTimingEventToState);
  }

  FutureOr<void> _mapNamazEventToState(
      NamazEvent event, Emitter<NamazState> emit) {
    emit(NamazLoading());
  }

  FutureOr<void> _mapFetchNamazTimingEventToState(
      FetchNamazTimingEvent event, Emitter<NamazState> emit) async {
    final res = await _namazTimingUsecase.call(
      NamazTimingParams(city: event.city, country: event.country),
    );

    res.fold(
      (error) => emit(NamazFailed(message: error.message)),
      (namazTimings) => emit(NamazSuccess(namazTimings: namazTimings)),
    );
  }
}
