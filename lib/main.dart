import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/router/app_router_config.dart';
import 'package:weather_bloc/screens/splash_screen/bloc/splash_bloc.dart';

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
        BlocProvider<SplashScreenBloc>(create: (context) => SplashScreenBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter().goRouter,
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        darkTheme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 6, 26, 64),
            primary: const Color.fromARGB(255, 6, 26, 64),
            secondary: const Color.fromARGB(255, 3, 83, 164),
          ),
          useMaterial3: true,
          textTheme: TextTheme(
            bodyLarge: const TextStyle(
              fontSize: 20.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            bodyMedium: const TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            bodySmall: const TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            displayLarge: const TextStyle(
              fontSize: 20.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            displayMedium: const TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            displaySmall: const TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 6, 26, 64),
            primary: const Color.fromARGB(255, 6, 26, 64),
            secondary: const Color.fromARGB(255, 3, 83, 164),
          ),
          useMaterial3: true,
          textTheme: TextTheme(
            bodyLarge: const TextStyle(
              fontSize: 20.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            bodyMedium: const TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            bodySmall: const TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            displayLarge: const TextStyle(
              fontSize: 20.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            displayMedium: const TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            displaySmall: const TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
