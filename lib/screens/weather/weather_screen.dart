import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_bloc/screens/weather/widgets/custom_appbar.dart';
import 'package:weather_bloc/screens/weather/widgets/main_weather_card_widget.dart';
import 'package:weather_bloc/screens/weather/widgets/side_heading_widget.dart';

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
        ],
      ),
    );
  }
}
