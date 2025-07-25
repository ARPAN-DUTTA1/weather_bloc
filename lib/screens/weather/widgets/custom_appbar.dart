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
        title,
        style: Theme.of(
          context,
        ).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w600),
      ),
      centerTitle: false,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: onRefresh, icon: const Icon(Icons.refresh)),
      ],
    );
  }
}
