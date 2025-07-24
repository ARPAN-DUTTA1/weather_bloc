import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_bloc/router/app_router_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      context.goNamed(AppRouterConstants.weatherScreen);
    });

    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.bounceOut,
          duration: const Duration(seconds: 2),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(scale: value, child: child),
            );
          },
          child: SizedBox(
            height: 200.0,
            width: 200.0,
            child: Image.asset(
              'asset/img/logo.png',
              fit: BoxFit.cover,
              isAntiAlias: true,
              colorBlendMode: BlendMode.darken,
            ),
          ),
        ),
      ),
    );
  }
}
