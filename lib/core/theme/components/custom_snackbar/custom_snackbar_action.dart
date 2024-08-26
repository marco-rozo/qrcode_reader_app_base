import 'package:flutter/widgets.dart';

class CustomSnackbarAction {
  final String? label;
  final IconData? icon;
  final VoidCallback onPressed;

  CustomSnackbarAction({
    this.label,
    this.icon,
    required this.onPressed,
  });
}
