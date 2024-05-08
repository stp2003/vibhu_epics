import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyBoardType;
  final String hintText;
  final TextCapitalization? textCapitalization;
  final Function()? onTap;
  final Widget? suffixWidget;
  final bool readOnly;
  const ProfileTextField({
    super.key,
    required this.controller,
    required this.validator,
    this.keyBoardType = TextInputType.text,
    required this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.suffixWidget,
    this.readOnly = false,
  });

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: 90.w,
      child: TextFormField(
        textCapitalization: widget.textCapitalization!,
        // autofocus: true,
        controller: widget.controller,

        readOnly: widget.readOnly,
        validator: widget.validator,
        onChanged: (value) => widget.controller.text = value,
        onTap: widget.onTap,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          suffixIcon: widget.suffixWidget,
          filled: true,
          fillColor: CupertinoColors.lightBackgroundGray,
          hintText: widget.hintText,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          // errorText: "Name Missing",
          errorStyle: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
        keyboardType: widget.keyBoardType,
      ),
    );
  }
}
