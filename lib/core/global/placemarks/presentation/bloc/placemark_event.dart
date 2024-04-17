part of 'placemark_bloc.dart';

@immutable
sealed class PlacemarkEvent {
  @override
  String toString() => 'Placemark Event';
}

final class FetchPlacemarkEvent extends PlacemarkEvent {
  @override
  String toString() => 'Fetch Placemark Event';
}
