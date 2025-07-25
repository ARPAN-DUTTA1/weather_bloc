import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_bloc/screens/weather/widgets/custom_appbar.dart';
import 'package:weather_bloc/screens/weather/widgets/main_weather_card_widget.dart';
import 'package:weather_bloc/screens/weather/widgets/side_heading_widget.dart';
import 'package:weather_bloc/screens/weather/widgets/weather_forecast_card_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomAppbar(
            title: 'Weather App',
            onSearch: () {
              // your refresh logic
            },
            onRefresh: () {
              // your refresh logic
            },
          ),
          MainWeatherCardWidget(
            tempText: '12.0° C',
            color: color.primary,
            height: size.height * 0.40,
            width: size.width,
            icon: FontAwesomeIcons.cloudShowersWater,
            textStyle: text.displayLarge!,
          ),

          SideHeadingWidget(sideTitle: 'Hourly Forecast'),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 120.0, // control height of cards
              child: ListView.builder(
                cacheExtent: MediaQuery.of(context).size.width * 1.5,
                scrollDirection: Axis.horizontal,
                itemCount: 220,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: WeatherForecastCard(
                      date: '25/07/2025',
                      icon: FontAwesomeIcons.cloud,
                      time: '09:45 AM',
                      textStyle: Theme.of(context).textTheme.bodySmall!,
                      borderColor: Theme.of(context).colorScheme.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
