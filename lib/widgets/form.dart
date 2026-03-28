import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.textInputAction,
    required this.keyboardType,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
