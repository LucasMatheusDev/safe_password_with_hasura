import 'package:flutter/material.dart';

class CustomStyleForm {
  /// Create for a [TextFormField] a rounded border with
  /// and [labelText] colored white
  InputDecoration roundedBorder({required String label}) {
    return InputDecoration(
      labelStyle: const TextStyle(color: Colors.white),
      labelText: label,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
    );
  }
}
