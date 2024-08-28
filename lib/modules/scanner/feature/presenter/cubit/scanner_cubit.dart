import 'package:code_bar_reader_base/core/externals/permission_manager/enums/permission_manager_status_enum.dart';
import 'package:code_bar_reader_base/core/externals/permission_manager/permission_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  final PermissionManager _permissionManager;

  ScannerCubit({
    required PermissionManager permissionManager,
  })  : _permissionManager = permissionManager,
        super(ScannerInitial());

  late QRViewController _qrController;

  Future<void> init() async {
    emit(ScannerLoading());
    await Future.delayed(const Duration(seconds: 2));
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    PermissionManagerStatusEnum status =
        await _permissionManager.requestCameraPermission();

    if (status == PermissionManagerStatusEnum.denied ||
        status == PermissionManagerStatusEnum.permanentlyDenied) {
      emit(ScannerPermissionDeniedState(
        message: 'Permission denied',
      ));
    }

    if (status == PermissionManagerStatusEnum.granted) {
      emit(ScannerSuccess());
    }
  }

  Future<void> setQRViewController(QRViewController controller) async {
    _qrController = controller;
    _qrController.scannedDataStream.listen((scanData) async {
      await controller.pauseCamera();
      _processQRCode(scanData);
    });
  }

  void _processQRCode(Barcode scanData) {
    try {
      // TODO implementar a lógica necessária para processar o QR Code
      debugPrint('QR Code Scanned: ${scanData.code}');
      emit(ScannedSucess());
    } catch (error) {
      emit(ScannerError(message: error.toString()));
    }
  }

  @override
  Future<void> close() {
    _qrController.dispose();
    return super.close();
  }

  void changeFlashMode() async {
    await _qrController.toggleFlash();
  }
}
