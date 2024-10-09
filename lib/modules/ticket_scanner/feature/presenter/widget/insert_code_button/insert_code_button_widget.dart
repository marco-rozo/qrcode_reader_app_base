import 'package:code_bar_reader_base/core/theme/components/custom_button/custom_button.dart';
import 'package:flutter/material.dart';

class InsertCodeButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const InsertCodeButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Alignment alignment;
    EdgeInsets padding;
    alignment = Alignment.bottomCenter;
    padding = const EdgeInsets.only(bottom: 40, left: 35, right: 35);
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: CustomButton.primary(
          text: 'Inserir manualmente',
          onPressed: onPressed,
        ),
      ),
    );
  }
}
