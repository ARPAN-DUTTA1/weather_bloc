import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_bloc/router/app_router_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 6), () {
      context.goNamed(AppRouterConstants.weatherScreen);
    });

    return Scaffold(
      body: Center(
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
    );
  }
}
