import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: 1,
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF37317)),
    );
  }
}
