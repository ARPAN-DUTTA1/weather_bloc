// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AdditionalCardWidget extends StatelessWidget {
  final String heading;
  final String value;
  final IconData icon;
  final Color color;
  // final Color iconColor;
  final TextStyle textStyle;
  const AdditionalCardWidget({
    super.key,
    required this.heading,
    required this.value,
    required this.icon,
    required this.color,
    // required this.iconColor,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: color, width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            Text(heading, style: textStyle),
            Text(value, style: textStyle),
          ],
        ),
      ),
    );
  }
}
