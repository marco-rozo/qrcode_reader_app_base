import 'package:code_bar_reader_base/core/theme/components/custom_snackbar/custom_snackbar_action.dart';
import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:flutter/material.dart';

mixin CustomSnackBar {
  void showCustomSnackBar(
    BuildContext context, {
    required String message,
    CustomSnackbarAction? customSnackbarAction,
    bool showCloseIcon = true,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColors.backgroundDarkPrimary,
      action: customSnackbarAction != null
          ? SnackBarAction(
              label: customSnackbarAction.label ?? '',
              textColor: Colors.white,
              onPressed: customSnackbarAction.onPressed,
            )
          : null,
      showCloseIcon: showCloseIcon,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 32,
      ),
      padding: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
      ),
      duration: const Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
