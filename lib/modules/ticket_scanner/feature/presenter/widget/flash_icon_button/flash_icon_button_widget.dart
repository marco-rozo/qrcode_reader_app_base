import 'package:flutter/material.dart';

class FlashIconButtonWidget extends StatefulWidget {
  final VoidCallback changeFlashMode;

  const FlashIconButtonWidget({
    super.key,
    required this.changeFlashMode,
  });

  @override
  State<FlashIconButtonWidget> createState() => _FlashIconButtonWidgetState();
}

class _FlashIconButtonWidgetState extends State<FlashIconButtonWidget> {
  bool isFlashOn = false;

  void _changeFlashMode() {
    widget.changeFlashMode();
    setState(() {
      isFlashOn = !isFlashOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    Alignment alignment;
    EdgeInsets padding;
    alignment = Alignment.topCenter;
    padding = const EdgeInsets.only(top: 35);
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: IconButton(
          iconSize: 32,
          color: Colors.white,
          icon: Icon(
            isFlashOn ? Icons.flash_on : Icons.flash_off,
            color: Colors.white,
          ),
          onPressed: _changeFlashMode,
        ),
      ),
    );
  }
}
