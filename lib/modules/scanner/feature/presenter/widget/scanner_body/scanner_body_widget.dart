import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/presenter/widget/close_icon_button/close_icon_button_widget.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/presenter/widget/flash_icon_button/flash_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerBodyWidget extends StatelessWidget {
  final Function(QRViewController) setQRViewController;
  final VoidCallback toggleFlash;
  final Key qrKey;

  const ScannerBodyWidget({
    super.key,
    required this.setQRViewController,
    required this.qrKey,
    required this.toggleFlash,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: setQRViewController,
          overlay: QrScannerOverlayShape(
            borderColor: AppColors.primary,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: 300,
          ),
        ),
        const CloseIconButtonWidget(),
        FlashIconButtonWidget(
          changeFlashMode: toggleFlash,
        ),
      ],
    );
  }
}
