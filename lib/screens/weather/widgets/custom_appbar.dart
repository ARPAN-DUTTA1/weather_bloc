import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/provider/theme_provider/bloc/theme_bloc.dart';

class CustomAppbar extends StatelessWidget {
  final String tempText;
  final IconData icon;
  final TextStyle textStyle;
  final VoidCallback? onRefresh;
  final VoidCallback? onSearch;
  final bool showWeatherCard;

  const CustomAppbar({
    super.key,
    required this.tempText,
    required this.icon,
    required this.textStyle,
    this.onRefresh,
    this.onSearch,
    this.showWeatherCard = true, // default: true
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final color = Theme.of(context).colorScheme;

    return SliverAppBar(
      pinned: true,
      expandedHeight: showWeatherCard
          ? MediaQuery.of(context).size.height * 0.55
          : kToolbarHeight,
      flexibleSpace: showWeatherCard
          ? FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Gradient Background
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(0.4),
                          Colors.purple.withOpacity(0.4),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),

                  // Blur
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(color: color.primary.withOpacity(0.2)),
                  ),

                  // Shadow (if light mode)
                  if (!isDarkMode)
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),

                  // Weather card content
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, size: 80, color: Colors.white),
                        const SizedBox(height: 30),
                        Text(tempText, style: textStyle),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : null, // <-- No flexibleSpace if not showing card
      leadingWidth: 60,
      leading: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
              icon: Icon(
                state.themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.sunny,
              ),
            ),
          );
        },
      ),
      title: Text(
        "Weather App",
        style: Theme.of(
          context,
        ).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w600),
      ),
      centerTitle: false,
      actions: [
        IconButton(onPressed: onSearch, icon: const Icon(Icons.search)),
        IconButton(onPressed: onRefresh, icon: const Icon(Icons.refresh)),
      ],
    );
  }
}
