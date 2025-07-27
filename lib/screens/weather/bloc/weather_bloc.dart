import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_bloc/data/repository/weather_fetch.dart';
import 'package:weather_bloc/screens/weather/model/weather_data_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherFetch _weatherFetch;

  WeatherBloc({WeatherFetch? weatherFetch})
    : _weatherFetch = weatherFetch ?? WeatherFetch(),
      super(WeatherInitial()) {
    on<WeatherRequested>(_weatherRequested);
  }

  FutureOr<void> _weatherRequested(
    WeatherRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final response = await _weatherFetch.fetchWeatherData(event.cityName);
      if (response['cod'] != '200') {
        throw Exception('Could not fetch weather data');
      }
      if (response['list'] == null || response['list'] is! List<dynamic>) {
        throw Exception('Invalid response: No forecast data available');
      }
      final baseWeatherDataModels = (response['list'] as List<dynamic>)
          .take(40) // Use all available forecast data (5 days)
          .map(
            (item) => WeatherDataModel.fromMap({
              'city': response['city'],
              'weatherItem': item,
            }),
          )
          .toList();

      // Interpolate to get hourly data for 24 hours (24 cards)
      final weatherDataModels = _interpolateHourlyData(
        baseWeatherDataModels,
        24,
      );
      emit(WeatherLoaded(weatherDataModels: weatherDataModels));
    } catch (e) {
      emit(WeatherError(message: 'Failed to load weather data'));
    }
  }

  List<WeatherDataModel> _interpolateHourlyData(
    List<WeatherDataModel> baseData,
    int hours,
  ) {
    if (baseData.isEmpty) return [];
    final result = <WeatherDataModel>[];
    for (int i = 0; i < baseData.length - 1 && result.length < hours; i++) {
      final current = baseData[i];
      final next = baseData[i + 1];
      final currentTime = current.time;
      final nextTime = next.time;
      final timeDiff = nextTime.difference(currentTime).inHours;

      // Add current data point
      result.add(current);

      // Interpolate between current and next (3-hour gap)
      for (int j = 1; j < timeDiff && result.length < hours; j++) {
        final fraction = j / timeDiff;
        final interpolatedTime = currentTime.add(Duration(hours: j));
        final interpolatedTemp =
            current.temp + (next.temp - current.temp) * fraction;
        final interpolatedWindSpeed =
            current.windSpeed + (next.windSpeed - current.windSpeed) * fraction;
        final interpolatedHumidity =
            (current.humidity + (next.humidity - current.humidity) * fraction)
                .round();
        final interpolatedPressure =
            (current.pressure + (next.pressure - current.pressure) * fraction)
                .round();

        result.add(
          WeatherDataModel(
            cityName: current.cityName,
            sky: current.sky, // Use current sky (no interpolation for strings)
            temp: interpolatedTemp,
            windSpeed: interpolatedWindSpeed,
            humidity: interpolatedHumidity,
            pressure: interpolatedPressure,
            date: interpolatedTime,
            time: interpolatedTime,
          ),
        );
      }
    }
    // Add the last data point if needed
    if (result.length < hours && baseData.isNotEmpty) {
      result.add(baseData.last);
    }
    return result.take(hours).toList();
  }
}
