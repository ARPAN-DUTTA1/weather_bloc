import 'package:dio/dio.dart';
import 'package:weather_bloc/data/secrets/secrets.dart';

class WeatherFetch {
  final dio = Dio();
  Future<Map<String, dynamic>> fetchWeatherData(String? cityName) async {
    final queryCity = cityName ?? 'Asansol';
    try {
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast',
        queryParameters: {
          'q': queryCity,
          'appid': openWeatherAPIKey,
          'units': 'metric',
        },
      );
      if (response.statusCode == 200) {
        
        return response.data;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
