import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color customColor;
  final String text;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    required this.customColor,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            backgroundColor: customColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 0.8,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
