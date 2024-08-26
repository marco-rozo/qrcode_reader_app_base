import 'package:flutter/material.dart';

class ScannerCameraErrorWidget extends StatelessWidget {
  const ScannerCameraErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error: Camera not found'),
    );
  }
}
