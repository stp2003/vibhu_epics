import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final void Function()? onPressed;
  final bool obscureText; // hide the dta entered in the field

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.onPressed,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: Color.fromARGB(255, 10, 185, 121),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.6,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              obscureText: obscureText,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: const Color.fromARGB(255, 10, 185, 121),
          ),
        ],
      ),
    );
  }
}
