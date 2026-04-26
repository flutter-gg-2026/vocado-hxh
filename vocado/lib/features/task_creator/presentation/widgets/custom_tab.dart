import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.text, required this.color, required this.isActive});
final String text;
final Color color;
final bool isActive;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        const SizedBox(height: 5),
        if (isActive)
          Container(
            height: 2,
            width: 60,
            color: color,
          )
      ],
    );
  }
}