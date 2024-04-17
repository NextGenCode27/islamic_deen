part of 'location_permission_bloc.dart';

@immutable
sealed class LocationPermissionEvent {
  @override
  String toString() => 'Location Event';
}

final class IsLocatedLocationPermissionEvent extends LocationPermissionEvent {
  @override
  String toString() => 'Is Located Location Event';
}
