import 'package:flutter/material.dart';

class WeatherForecastCard extends StatelessWidget {
  final String date;
  final IconData icon;
  final String time;
  final TextStyle? textStyle;
  final Color borderColor;

  const WeatherForecastCard({
    super.key,
    required this.date,
    required this.icon,
    required this.time,
    required this.textStyle,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      decoration: BoxDecoration(
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
          Icon(icon, size: 28.0),
          Text(
            time,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
