// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WeatherForecastCard extends StatelessWidget {
  final String date;
  final Color color;
  final IconData icon;
  final String temperature;
  final TextStyle? textStyle;
  final Color borderColor;

  const WeatherForecastCard({
    super.key,
    required this.date,
    required this.color,
    required this.icon,
    required this.temperature,
    required this.textStyle,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: borderColor, width: 2.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            date,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          Icon(icon, size: 28.0, color: const Color(0xffFFFFFF)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              temperature,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
