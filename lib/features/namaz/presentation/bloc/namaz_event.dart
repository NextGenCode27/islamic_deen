part of 'namaz_bloc.dart';

@immutable
sealed class NamazEvent {
  @override
  String toString() => 'Namaz Event';
}

final class FetchNamazTimingEvent extends NamazEvent {
  final String city;
  final String country;

  FetchNamazTimingEvent({required this.city, required this.country});
  @override
  String toString() => 'Fetch Namaz Namaz Timing Event';
}
