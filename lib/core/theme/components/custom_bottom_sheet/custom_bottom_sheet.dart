import 'dart:ui';

import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:flutter/material.dart';

mixin CustomBottomSheet {
  Future<void> showCustomBlurredBottomSheet(
    BuildContext context, {
    bool showDragHandle = false,
    double blurIntensity = 20,
    required Widget child,
  }) =>
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: blurIntensity, sigmaY: blurIntensity),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.backgroundLightSecondary,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Visibility(
                      visible: showDragHandle,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 32,
                              height: 4,
                              decoration: BoxDecoration(
                                color: AppColors.dragHandle,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    child,
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Future<T?> showCustomBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool showDragHandle = true,
    bool enableDrag = true,
    double elevation = 1,
    Color? barrierColor,
    double initialChildSize = 0.5,
    bool blurredBackground = false,
  }) =>
      showModalBottomSheet<T>(
        isDismissible: isDismissible,
        showDragHandle: showDragHandle,
        enableDrag: enableDrag,
        elevation: elevation,
        useSafeArea: true,
        barrierColor: barrierColor,
        isScrollControlled: isScrollControlled,
        backgroundColor: AppColors.backgroundLightSecondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28.0),
          ),
        ),
        context: context,
        builder: (context) => DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          snap: true,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                child: child,
              ),
            );
          },
        ),
      );
}
