import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomAppbar(
            showWeatherCard: true,
            tempText: '12.0° C',
            icon: FontAwesomeIcons.cloudShowersWater,
            textStyle: text.displayLarge!,
            onSearch: () {},
            onRefresh: () {},
          ),

          // MainWeatherCardWidget(
          //   tempText: '12.0° C',
          //   color: color.primary,
          //   height: size.height * 0.6,
          //   width: size.width,
          //   icon: FontAwesomeIcons.cloudShowersWater,
          //   textStyle: text.displayLarge!,
          // ),
          SideHeadingWidget(sideTitle: 'Hourly Forecast'),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 120.0, // control height of cards
              child: ListView.builder(
                cacheExtent: MediaQuery.of(context).size.width * 1.5,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: WeatherForecastCard(
                      color: color.secondary,
                      date: '25/07/2025',
                      icon: FontAwesomeIcons.cloud,
                      temperature: '32.0° C',
                      textStyle: Theme.of(context).textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                      borderColor: Colors.transparent,
                    ),
                  );
                },
              ),
            ),
          ),

          SideHeadingWidget(sideTitle: 'Additional Information'),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalCardWidget(
                    heading: 'Humidity',
                    value: '20%',
                    icon: FontAwesomeIcons.droplet,
                    color: color.secondary,
                    textStyle: text.bodySmall!,
                  ),
                  AdditionalCardWidget(
                    heading: 'Wind',
                    value: '10 km/h',
                    icon: FontAwesomeIcons.wind,
                    color: color.secondary,
                    textStyle: text.bodySmall!,
                  ),
                  AdditionalCardWidget(
                    heading: 'Pressure',
                    value: '1000 hPa',
                    icon: FontAwesomeIcons.umbrella,
                    color: color.secondary,
                    textStyle: text.bodySmall!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
