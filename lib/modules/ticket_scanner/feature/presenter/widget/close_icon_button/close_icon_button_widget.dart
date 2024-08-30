import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CloseIconButtonWidget extends StatelessWidget {
  const CloseIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Alignment alignment;
    EdgeInsets padding;
    alignment = Alignment.topLeft;
    padding = const EdgeInsets.only(top: 35, left: 20);
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: IconButton(
          iconSize: 32,
          color: Colors.white,
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
