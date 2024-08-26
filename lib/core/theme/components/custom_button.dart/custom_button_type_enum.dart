import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:code_bar_reader_base/core/theme/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

enum CustomButtonTypeEnum {
  primary(
    backgroundColor: AppColors.primaryLight,
    borderColor: AppColors.primaryLight,
    progressIndicatorColor: AppColors.backgroundLightPrimary,
    textStyle: AppTextStyle.primaryButtonText,
    disabledColor: AppColors.disabled,
    splashColor: AppColors.primary,
  ),
  secondary(
    backgroundColor: AppColors.backgroundLightPrimary,
    borderColor: AppColors.borderLight,
    progressIndicatorColor: AppColors.primary,
    textStyle: AppTextStyle.secondaryButtonText,
    disabledColor: AppColors.primary,
    splashColor: AppColors.backgroundLightSecondary,
  ),
  negative(
    backgroundColor: AppColors.negative,
    borderColor: AppColors.negative,
    progressIndicatorColor: AppColors.backgroundLightPrimary,
    textStyle: AppTextStyle.primaryButtonText,
    disabledColor: AppColors.disabled,
    splashColor: AppColors.negative,
  );

  final Color backgroundColor;
  final Color borderColor;
  final Color progressIndicatorColor;
  final Color disabledColor;
  final TextStyle textStyle;
  final Color splashColor;

  const CustomButtonTypeEnum({
    required this.backgroundColor,
    required this.borderColor,
    required this.progressIndicatorColor,
    required this.disabledColor,
    required this.textStyle,
    required this.splashColor,
  });
}
