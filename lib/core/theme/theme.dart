import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:code_bar_reader_base/core/theme/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  fontFamily: AppTextStyle.fontFamily,
  scaffoldBackgroundColor: AppColors.backgroundLightSecondary,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryLight,
    secondary: AppColors.secondaryLight,
    error: AppColors.negative,
  ),
);