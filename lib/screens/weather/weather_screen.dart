import 'package:flutter/material.dart';
import 'package:weather_bloc/screens/weather/widgets/custom_appbar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppbar(
            title: 'Weather App',
            onRefresh: () {
              // your refresh logic
            },
          ),
          // SliverToBoxAdapter(child: ),
        ],
      ),
    );
  }
}
