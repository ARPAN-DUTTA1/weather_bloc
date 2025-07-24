part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenState {}

final class SplashScreenInitial extends SplashScreenState {}

final class SplashScreenAnimate extends SplashScreenState {}

final class SplashScreenFinished extends SplashScreenState {}
