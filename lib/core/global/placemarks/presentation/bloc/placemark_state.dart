part of 'placemark_bloc.dart';

@immutable
sealed class PlacemarkState {
  @override
  String toString() => 'Placemark State';
}

final class PlacemarkInitial extends PlacemarkState {
  @override
  String toString() => 'Placemark Initial';
}

final class PlacemarkLoading extends PlacemarkState {
  @override
  String toString() => 'Placemark Loading';
}

final class PlacemarkSuccess extends PlacemarkState {
  final List<Placemark> placemark;

  PlacemarkSuccess({required this.placemark});
  @override
  String toString() => 'Placemark Success';
}

final class PlacemarkFailed extends PlacemarkState {
  final String message;

  PlacemarkFailed({required this.message});
  @override
  String toString() => 'Placemark Failed';
}
