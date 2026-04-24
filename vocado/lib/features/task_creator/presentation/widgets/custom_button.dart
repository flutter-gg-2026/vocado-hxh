import 'package:flutter/material.dart';

class CustomButtonPuple extends StatelessWidget {
  const CustomButtonPuple({super.key, required this.text});
  final String text;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF6A1B9A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
        },
        child: Text(text, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
