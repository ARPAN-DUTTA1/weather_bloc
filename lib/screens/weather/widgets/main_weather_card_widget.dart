import 'dart:ui';
import 'package:flutter/material.dart';

class MainWeatherCardWidget extends StatelessWidget {
  final String tempText;
  final Color color;
  final double height;
  final double width;
  final IconData icon;
  final TextStyle textStyle;

  const MainWeatherCardWidget({
    super.key,
    required this.tempText,
    required this.color,
    required this.height,
    required this.width,
    required this.icon,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SliverToBoxAdapter(
      child: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: Stack(
            children: [
              // Gradient Background
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.4),
                      Colors.purple.withOpacity(0.4),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              // Blur effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2), // slight tint over blur
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: isDarkMode
                        ? []
                        : [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, size: 80.0, color: Colors.white),
                      const SizedBox(height: 30),
                      Text(tempText, style: textStyle),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
