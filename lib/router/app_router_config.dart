import 'package:go_router/go_router.dart';
import 'package:weather_bloc/router/app_router_constants.dart';
import 'package:weather_bloc/screens/splash_screen/splash_screen.dart';
import 'package:weather_bloc/screens/weather/weather_screen.dart';

class AppRouter {
  GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRouterConstants.splashScreen,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/weather_screen',
        name: AppRouterConstants.weatherScreen,
        builder: (context, state) {
          return const WeatherScreen();
        },
      ),
    ],
  );
}
