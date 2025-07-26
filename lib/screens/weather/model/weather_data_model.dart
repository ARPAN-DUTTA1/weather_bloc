// lib/models/weather_data_model.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherDataModel {
  final String cityName;
  final String sky;
  final double temp;
  final double windSpeed;
  final int humidity;
  final int pressure;
  final DateTime date;
  final DateTime time;

  WeatherDataModel({
    required this.cityName,
    required this.sky,
    required this.temp,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    required this.date,
    required this.time,
  });

  WeatherDataModel copyWith({
    String? cityName,
    String? sky,
    double? temp,
    double? windSpeed,
    int? humidity,
    int? pressure,
    DateTime? date,
    DateTime? time,
  }) {
    return WeatherDataModel(
      cityName: cityName ?? this.cityName,
      sky: sky ?? this.sky,
      temp: temp ?? this.temp,
      windSpeed: windSpeed ?? this.windSpeed,
      humidity: humidity ?? this.humidity,
      pressure: pressure ?? this.pressure,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cityName': cityName,
      'sky': sky,
      'temp': temp,
      'windSpeed': windSpeed,
      'humidity': humidity,
      'pressure': pressure,
      'date': date.millisecondsSinceEpoch,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory WeatherDataModel.fromMap(Map<String, dynamic> map) {
    return WeatherDataModel(
      cityName: map['name'] as String,
      sky: map['weather'][0]['main'] as String,
      temp: (map['main']['temp'] as num).toDouble(),
      windSpeed: (map['wind']['speed'] as num).toDouble(),
      humidity: map['main']['humidity'] as int,
      pressure: map['main']['pressure'] as int,
      date: DateTime.fromMillisecondsSinceEpoch((map['dt'] as int) * 1000),
      time: DateTime.fromMillisecondsSinceEpoch((map['dt'] as int) * 1000),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      WeatherDataModel.fromMap(json);

  @override
  String toString() {
    return 'WeatherDataModel(cityName: $cityName, sky: $sky, temp: $temp, windSpeed: $windSpeed, humidity: $humidity, pressure: $pressure, date: $date, time: $time)';
  }

  @override
  bool operator ==(covariant WeatherDataModel other) {
    if (identical(this, other)) return true;

    return other.cityName == cityName &&
        other.sky == sky &&
        other.temp == temp &&
        other.windSpeed == windSpeed &&
        other.humidity == humidity &&
        other.pressure == pressure &&
        other.date == date &&
        other.time == time;
  }

  @override
  int get hashCode {
    return cityName.hashCode ^
        sky.hashCode ^
        temp.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode ^
        pressure.hashCode ^
        date.hashCode ^
        time.hashCode;
  }
}
