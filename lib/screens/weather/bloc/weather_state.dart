part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final WeatherDataModel weatherDataModel;

  WeatherLoaded({required this.weatherDataModel});
}

final class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}
