import 'package:flutter/material.dart';

class CustomCircularAvatar extends StatelessWidget {
  final double radius;
  final String imagePath;

  const CustomCircularAvatar({
    super.key,
    required this.radius,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
