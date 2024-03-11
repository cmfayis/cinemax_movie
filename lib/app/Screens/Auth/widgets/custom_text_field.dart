import 'package:flutter/material.dart';
import 'package:movieapp/app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final validator;
  bool obscureText;
  CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.obscureText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        
          contentPadding: const EdgeInsets.only(top: 5, left: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: labelText,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          fillColor: AppColors.KBackground.withOpacity(0.7),
          filled: true),
      validator: validator,
    );
  }
}
