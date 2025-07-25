import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/provider/theme_provider/bloc/theme_bloc.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final VoidCallback? onRefresh;

  const CustomAppbar({super.key, required this.title, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: true,
      stretch: true,
      // expandedHeight: 200,
      // forceMaterialTransparency: true,
      title: Text(title, style: Theme.of(context).textTheme.displayMedium),
      centerTitle: false,
      actions: [
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
              icon: Icon(
                state.themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.sunny,
              ),
            );
          },
        ),
        IconButton(onPressed: onRefresh, icon: const Icon(Icons.refresh)),
      ],
    );
  }
}
