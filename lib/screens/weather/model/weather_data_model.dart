// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherDataModel {
  final String cityName;
  final double temp;
  final double windSpeed;
  final int humidity;
  final int pressure;
  final DateTime date;
  final DateTime time;
  WeatherDataModel({
    required this.cityName,
    required this.temp,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    required this.date,
    required this.time,
  });

  WeatherDataModel copyWith({
    String? cityName,
    double? temp,
    double? windSpeed,
    int? humidity,
    int? pressure,
    DateTime? date,
    DateTime? time,
  }) {
    return WeatherDataModel(
      cityName: cityName ?? this.cityName,
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
      cityName: map['cityName'] as String,
      temp: map['temp'] as double,
      windSpeed: map['windSpeed'] as double,
      humidity: map['humidity'] as int,
      pressure: map['pressure'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDataModel.fromJson(String source) =>
      WeatherDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherDataModel(cityName: $cityName, temp: $temp, windSpeed: $windSpeed, humidity: $humidity, pressure: $pressure, date: $date, time: $time)';
  }

  @override
  bool operator ==(covariant WeatherDataModel other) {
    if (identical(this, other)) return true;

    return other.cityName == cityName &&
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
        temp.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode ^
        pressure.hashCode ^
        date.hashCode ^
        time.hashCode;
  }
}
