part of 'namaz_bloc.dart';

@immutable
sealed class NamazState {
  @override
  String toString() => 'Namaz State';
}

final class NamazInitial extends NamazState {
  @override
  String toString() => 'Namaz Initial';
}

final class NamazLoading extends NamazState {
  @override
  String toString() => 'Namaz Loading';
}

final class NamazSuccess extends NamazState {
  final NamazEntity namazTimings;

  NamazSuccess({required this.namazTimings});
  @override
  String toString() => 'Namaz Success';
}

final class NamazFailed extends NamazState {
  final String message;

  NamazFailed({required this.message});
  @override
  String toString() => 'Namaz Failed';
}
