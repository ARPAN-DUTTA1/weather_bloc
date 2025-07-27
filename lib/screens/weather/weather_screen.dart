// lib/screens/weather/weather_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_bloc/screens/weather/bloc/weather_bloc.dart';
import 'package:weather_bloc/screens/weather/widgets/additional_card_widget.dart';
import 'package:weather_bloc/screens/weather/widgets/custom_appbar.dart';
import 'package:weather_bloc/screens/weather/widgets/side_heading_widget.dart';
import 'package:weather_bloc/screens/weather/widgets/weather_forecast_card_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final TextEditingController cityController = TextEditingController();

    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listenWhen: (previous, current) => current is WeatherError,
        buildWhen: (previous, current) => current is! WeatherActionState,
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                action: SnackBarAction(
                  label: 'Retry',
                  onPressed: () => context.read<WeatherBloc>().add(
                    WeatherRequested('Asansol'),
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const Center(child: Text("Please search a city"));
          }

          if (state is WeatherError) {
            return Center(child: Text(state.message));
          }

          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is WeatherLoaded) {
            final weather = state.weatherDataModels.isNotEmpty
                ? state.weatherDataModels.first
                : null;
            if (weather == null) {
              return const Center(child: Text("No weather data available"));
            }

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomAppbar(
                  showWeatherCard: true,
                  tempText: '${weather.temp.toStringAsFixed(1)} °C',
                  icon: (weather.sky == 'Clouds'
                      ? FontAwesomeIcons.cloud
                      : (weather.sky == 'Rain'
                            ? FontAwesomeIcons.cloudRain
                            : FontAwesomeIcons.sun)),
                  textStyle: text.displayLarge!,
                  onSearch: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Search City'),
                        content: TextField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            hintText: 'Enter city name',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (cityController.text.isNotEmpty) {
                                context.read<WeatherBloc>().add(
                                  WeatherRequested(cityController.text),
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Search'),
                          ),
                        ],
                      ),
                    );
                  },
                  onRefresh: () {
                    context.read<WeatherBloc>().add(
                      WeatherRequested(weather.cityName),
                    );
                  },
                ),

                const SideHeadingWidget(sideTitle: 'Hourly Forecast'),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 120.0,
                    child: ListView.builder(
                      cacheExtent: MediaQuery.of(context).size.width * 1.5,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.weatherDataModels.length,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemBuilder: (context, index) {
                        final forecast = state.weatherDataModels[index];
                        final hour = forecast.time.hour.toString().padLeft(
                          2,
                          '0',
                        );
                        final minute = forecast.time.minute.toString().padLeft(
                          2,
                          '0',
                        );
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: WeatherForecastCard(
                            color: color.secondary,
                            date: '$hour:$minute',
                            icon: (forecast.sky == 'Clouds'
                                ? FontAwesomeIcons.cloud
                                : (forecast.sky == 'Rain'
                                      ? FontAwesomeIcons.cloudRain
                                      : FontAwesomeIcons.sun)),
                            temperature:
                                '${forecast.temp.toStringAsFixed(1)} °C',
                            textStyle: text.displaySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            borderColor: Colors.transparent,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SideHeadingWidget(sideTitle: 'Additional Information'),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalCardWidget(
                          heading: 'Humidity',
                          value: '${weather.humidity}%',
                          icon: FontAwesomeIcons.droplet,
                          color: color.secondary,
                          textStyle: text.bodySmall!,
                        ),
                        AdditionalCardWidget(
                          heading: 'Wind',
                          value: '${weather.windSpeed.toStringAsFixed(1)} m/s',
                          icon: FontAwesomeIcons.wind,
                          color: color.secondary,
                          textStyle: text.bodySmall!,
                        ),
                        AdditionalCardWidget(
                          heading: 'Pressure',
                          value: '${weather.pressure} hPa',
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
          return const SizedBox();
        },
      ),
    );
  }
}
