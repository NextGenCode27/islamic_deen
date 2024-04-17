part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {
  @override
  String toString() => 'Splash Event';
}

final class InitializeAppEvent extends SplashEvent {
  @override
  String toString() => 'Initialize App Event';
}
