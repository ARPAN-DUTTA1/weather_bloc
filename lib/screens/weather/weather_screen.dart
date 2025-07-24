import 'package:flutter/material.dart';
import 'package:weather_bloc/screens/weather/widgets/custom_appbar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Weather App', onRefresh: () {}),
    );
  }
}
