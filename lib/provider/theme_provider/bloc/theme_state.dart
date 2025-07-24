part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {
  final ThemeMode themeMode;

  const ThemeState({required this.themeMode});
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(themeMode: ThemeMode.light);
}

final class LightTheme extends ThemeState {
  const LightTheme() : super(themeMode: ThemeMode.light);
}

final class DarkTheme extends ThemeState {
  const DarkTheme() : super(themeMode: ThemeMode.dark);
}
