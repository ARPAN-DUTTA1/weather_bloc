import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/provider/theme_provider/bloc/theme_bloc.dart';
import 'package:weather_bloc/router/app_router_config.dart';
import 'package:weather_bloc/screens/splash_screen/bloc/splash_bloc.dart';
import 'package:weather_bloc/screens/weather/bloc/weather_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // single SplashBloc instance
        BlocProvider<SplashScreenBloc>(create: (_) => SplashScreenBloc()),
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
        // don’t fire the request here
        BlocProvider<WeatherBloc>(create: (_) => WeatherBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter().goRouter,
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            themeMode: state.themeMode,
            darkTheme: ThemeData(
              fontFamily: 'Poppins',
              appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 139, 133, 193),
                centerTitle: false,
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
              scaffoldBackgroundColor: const Color.fromARGB(255, 32, 30, 31),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 139, 133, 193),
                primary: const Color.fromARGB(255, 139, 133, 193),
                secondary: const Color.fromARGB(255, 212, 205, 244),
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                bodyMedium: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                bodySmall: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                displayLarge: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                displayMedium: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                displaySmall: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            theme: ThemeData(
              fontFamily: 'Poppins',
              scaffoldBackgroundColor: const Color.fromARGB(255, 244, 244, 249),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 6, 26, 64),
                centerTitle: false,
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                titleTextStyle: TextStyle(fontSize: 18.0),
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 6, 26, 64),
                primary: const Color.fromARGB(255, 6, 26, 64),
                secondary: const Color.fromARGB(124, 142, 157, 216),
                brightness: Brightness.light,
              ),
              useMaterial3: true,
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                bodyMedium: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                bodySmall: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                displayLarge: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                displayMedium: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                displaySmall: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
