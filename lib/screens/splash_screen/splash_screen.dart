import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_bloc/router/app_router_constants.dart';
import 'package:weather_bloc/screens/splash_screen/bloc/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 148, 175, 226),
      body: BlocProvider(
        create: (_) => SplashScreenBloc()..add(SplashScreenStarted()),
        child: BlocListener<SplashScreenBloc, SplashScreenState>(
          listener: (context, state) {
            if (state is SplashScreenFinished) {
              print('SplashScreenFinished');
              context.goNamed(AppRouterConstants.weatherScreen);
            }
          },
          child: Center(
            child:
                SizedBox(
                      height: 200.0,
                      width: 200.0,
                      child: Image.asset(
                        'asset/img/logo.png',
                        fit: BoxFit.cover,
                        isAntiAlias: true,
                        colorBlendMode: BlendMode.darken,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 2.seconds)
                    .then(delay: 2.seconds)
                    .fadeOut(duration: 2.seconds),
          ),
        ),
      ),
    );
  }
}
