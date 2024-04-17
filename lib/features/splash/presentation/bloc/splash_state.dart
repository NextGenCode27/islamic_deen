part of 'splash_bloc.dart';

@immutable
sealed class SplashState {
  @override
  String toString() => 'Splash State';
}

final class SplashInitial extends SplashState {
  @override
  String toString() => 'Splash State';
}

final class SplashLoading extends SplashState {
  @override
  String toString() => 'Splash Loading State';
}

final class SplashSuccess extends SplashState {
  @override
  String toString() => 'Splash Success State';
}

final class SplashFailed extends SplashState {
  final String message;

  SplashFailed({required this.message});
  @override
  String toString() => 'Splash Failed State';
}
