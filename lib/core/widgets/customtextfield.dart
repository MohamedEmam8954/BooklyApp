import 'dart:developer';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onsubmit, required this.hintText});
  final void Function(String)? onsubmit;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onsubmit,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
