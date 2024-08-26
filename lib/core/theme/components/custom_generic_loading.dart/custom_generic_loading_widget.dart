import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomGenericLoadingWidget extends StatelessWidget {
  const CustomGenericLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitThreeBounce(
        color: AppColors.primary,
        size: 30.0,
      ),
    );
  }
}
