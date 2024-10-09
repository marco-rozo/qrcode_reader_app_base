import 'package:code_bar_reader_base/core/routes/app_named_routes.dart';
import 'package:code_bar_reader_base/core/theme/components/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton.primary(
            text: 'Show Components',
            onPressed: () => context.pushNamed(AppNamedRoutes.components),
          ),
        ],
      ),
    );
  }
}
