// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: isDarkMode
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    spreadRadius: 3.0,
                  ),
                ],
          color: color,
        ),
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80.0,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(tempText, style: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
