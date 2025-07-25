part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class WeatherRequested extends WeatherEvent {
  final String? cityName;
  WeatherRequested(this.cityName);
}
