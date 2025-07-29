import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/splash_bloc.dart';
import '../weather/bloc/weather_bloc.dart';
import '../../router/app_router_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // trigger both splash timer and weather fetch immediately
    context.read<SplashScreenBloc>().add(SplashScreenStarted());
    context.read<WeatherBloc>().add(WeatherRequested('Asansol'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7ECF6),
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashScreenFinished) {
            context.goNamed(AppRouterConstants.weatherScreen);
          }
        },
        child: Center(
          child:
              SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'asset/img/logo.png',
                      fit: BoxFit.cover,
                      isAntiAlias: true,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 2.seconds)
                  .then(delay: 2.seconds)
                  .fadeOut(duration: 2.seconds),
        ),
      ),
    );
  }
}
