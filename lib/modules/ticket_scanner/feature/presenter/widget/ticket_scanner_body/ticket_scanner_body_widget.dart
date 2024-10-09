import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/presenter/widget/close_icon_button/close_icon_button_widget.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/presenter/widget/flash_icon_button/flash_icon_button_widget.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/presenter/widget/insert_code_button/insert_code_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class TicketScannerBodyWidget extends StatefulWidget {
  final Function(QRViewController) setQRViewController;
  final VoidCallback toggleFlash;
  final VoidCallback openInsertManualCode;
  final Key qrKey;

  const TicketScannerBodyWidget({
    super.key,
    required this.setQRViewController,
    required this.qrKey,
    required this.toggleFlash,
    required this.openInsertManualCode,
  });

  @override
  State<TicketScannerBodyWidget> createState() =>
      _TicketScannerBodyWidgetState();
}

class _TicketScannerBodyWidgetState extends State<TicketScannerBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: widget.qrKey,
          cameraFacing: CameraFacing.back,
          onQRViewCreated: widget.setQRViewController,
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
          changeFlashMode: widget.toggleFlash,
        ),
        InsertCodeButtonWidget(
          onPressed: widget.openInsertManualCode,
        ),
      ],
    );
  }
}
