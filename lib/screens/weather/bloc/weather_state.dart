// lib/screens/weather/bloc/weather_state.dart
part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

@immutable
sealed class WeatherActionState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final List<WeatherDataModel> weatherDataModels;

  WeatherLoaded({required this.weatherDataModels});
}

final class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}