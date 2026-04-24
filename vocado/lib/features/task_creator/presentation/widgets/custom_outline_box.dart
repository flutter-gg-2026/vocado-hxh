import 'package:flutter/material.dart';

class CustomOutlineBox extends StatelessWidget {
  const CustomOutlineBox({super.key, required this.text});
final String text;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:Color(0xFF6A1B9A),
          width: 1.5,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF6A1B9A),
          fontSize: 14,
        ),
      ),
    );
  }
}