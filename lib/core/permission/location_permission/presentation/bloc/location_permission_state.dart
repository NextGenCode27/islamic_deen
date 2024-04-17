part of 'location_permission_bloc.dart';

@immutable
sealed class LocationPermissionState {
  @override
  String toString() => 'Location State';
}

final class LocationPermissionInitial extends LocationPermissionState {
  @override
  String toString() => 'Location Initial State';
}

final class LocationPermissionLoading extends LocationPermissionState {
  @override
  String toString() => 'Location Loading State';
}

final class LocationPermissionSuccess extends LocationPermissionState {
  final bool location;

  LocationPermissionSuccess({required this.location});
  @override
  String toString() => 'Location Success State';
}

final class LocationFailed extends LocationPermissionState {
  final String message;

  LocationFailed({required this.message});
  @override
  String toString() => 'Location Failed State';
}
