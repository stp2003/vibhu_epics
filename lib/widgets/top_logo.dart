import 'package:flutter/material.dart';

class TopLogo extends StatelessWidget {
  final double width;
  final double? height;

  const TopLogo({
    super.key,
    required this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            'assets/images/plant_care.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
