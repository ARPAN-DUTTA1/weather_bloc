// lib/screens/weather/weather_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../weather/bloc/weather_bloc.dart';
import 'widgets/additional_card_widget.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/side_heading_widget.dart';
import 'widgets/weather_forecast_card_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late final TextEditingController cityController;

  @override
  void initState() {
    super.initState();
    cityController = TextEditingController();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listenWhen: (_, current) => current is WeatherError,
        buildWhen: (_, current) => current is! WeatherActionState,
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                action: SnackBarAction(
                  label: 'Retry',
                  onPressed: () {
                    context.read<WeatherBloc>().add(
                      WeatherRequested('Asansol'),
                    );
                  },
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const Center(child: Text("Please search a city"));
          }

          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is WeatherError) {
            return Center(child: Text(state.message));
          }

          if (state is WeatherLoaded) {
            final forecasts = state.weatherDataModels;
            final current = forecasts.isNotEmpty ? forecasts.first : null;
            if (current == null) {
              return const Center(child: Text("No weather data available"));
            }

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomAppbar(
                  currentCityName: current.cityName,
                  showWeatherCard: true,
                  tempText: '${current.temp.toStringAsFixed(1)} °C',
                  icon: _mapSkyToIcon(current.sky),
                  textStyle: text.displayLarge!,
                  onSearch: _showSearchDialog,
                  onRefresh: () {
                    context.read<WeatherBloc>().add(
                      WeatherRequested(current.cityName),
                    );
                  },
                ),

                const SideHeadingWidget(sideTitle: 'Hourly Forecast'),
                SliverToBoxAdapter(
                  child: RepaintBoundary(
                    child: HourlyForecastList(
                      forecasts: forecasts,
                      color: color.secondary,
                      textStyle: text.displaySmall!,
                    ),
                  ),
                ),

                const SideHeadingWidget(sideTitle: 'Additional Information'),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalCardWidget(
                          heading: 'Humidity',
                          value: '${current.humidity}%',
                          icon: FontAwesomeIcons.droplet,
                          color: color.secondary,
                          textStyle: text.bodySmall!,
                        ),
                        AdditionalCardWidget(
                          heading: 'Wind',
                          value: '${current.windSpeed.toStringAsFixed(1)} m/s',
                          icon: FontAwesomeIcons.wind,
                          color: color.secondary,
                          textStyle: text.bodySmall!,
                        ),
                        AdditionalCardWidget(
                          heading: 'Pressure',
                          value: '${current.pressure} hPa',
                          icon: FontAwesomeIcons.umbrella,
                          color: color.secondary,
                          textStyle: text.bodySmall!,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          // Fallback for any other state
          return const SizedBox.shrink();
        },
      ),
    );
  }

  IconData _mapSkyToIcon(String sky) {
    if (sky == 'Clouds') return FontAwesomeIcons.cloud;
    if (sky == 'Rain') return FontAwesomeIcons.cloudRain;
    return FontAwesomeIcons.sun;
  }

  Future<void> _showSearchDialog() {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Search City'),
        content: TextField(
          controller: cityController,
          decoration: const InputDecoration(hintText: 'Enter city name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              cityController.clear();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final input = cityController.text.trim();
              if (input.isNotEmpty) {
                context.read<WeatherBloc>().add(WeatherRequested(input));
                Navigator.pop(context);
                cityController.clear();
              }
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}

/// Extracted widget for the hourly forecast list
class HourlyForecastList extends StatelessWidget {
  final List forecasts;
  final Color color;
  final TextStyle textStyle;

  const HourlyForecastList({
    super.key,
    required this.forecasts,
    required this.color,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        cacheExtent: MediaQuery.of(context).size.width * 1.5,
        scrollDirection: Axis.horizontal,
        itemCount: forecasts.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, i) {
          final f = forecasts[i];
          final h = f.time.hour.toString().padLeft(2, '0');
          final m = f.time.minute.toString().padLeft(2, '0');
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: WeatherForecastCard(
              color: color,
              date: '$h:$m',
              icon: _mapSkyToIcon(f.sky),
              temperature: '${f.temp.toStringAsFixed(1)} °C',
              textStyle: textStyle.copyWith(fontWeight: FontWeight.w600),
              borderColor: Colors.transparent,
            ),
          );
        },
      ),
    );
  }

  IconData _mapSkyToIcon(String sky) {
    if (sky == 'Clouds') return FontAwesomeIcons.cloud;
    if (sky == 'Rain') return FontAwesomeIcons.cloudRain;
    return FontAwesomeIcons.sun;
  }
}
