import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_bloc/data/repository/weather_fetch.dart';
import 'package:weather_bloc/screens/weather/model/weather_data_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherRequested>(_weatherRequested);
  }

  FutureOr<void> _weatherRequested(
    WeatherRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final response = await WeatherFetch().fetchWeatherData(event.cityName);
      final weatherDataModel = WeatherDataModel.fromJson(response);
      emit(WeatherLoaded(weatherDataModel: weatherDataModel));
    } catch (e) {
      emit(WeatherError(message: 'Failed to load weather data: $e'));
    }
  }
}
