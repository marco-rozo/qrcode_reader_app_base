import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:flutter/material.dart';

final class AppTextStyle {
  static const fontFamily = 'Poppins';

  static const TextStyle headline16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textLightPrimary,
  );

  static const TextStyle headline12 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textLightPrimary,
  );

  static const TextStyle body10 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textLightSecondary,
  );

  static const TextStyle headline20 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textLightPrimary,
  );

  static const TextStyle body12 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textLightSecondary,
  );
}
