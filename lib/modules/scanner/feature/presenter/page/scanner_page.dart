import 'package:code_bar_reader_base/core/theme/components/custom_generic_loading.dart/custom_generic_loading_widget.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/presenter/cubit/scanner_cubit.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/presenter/widget/scanner_body/scanner_body_widget.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/presenter/widget/scanner_camera_error/scanner_camera_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  late final ScannerCubit _scannerCubit;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    _scannerCubit = context.read<ScannerCubit>()..init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ScannerCubit, ScannerState>(
        bloc: _scannerCubit,
        listener: (context, state) {
          if (state is ScannedSucess) {
            context.pop();
          }
          if (state is ScannerError) {
            debugPrint('Error: ${state.message}');
            _scannerCubit.init();
          }
        },
        builder: (_, state) => switch (state) {
          ScannerSuccess() => ScannerBodyWidget(
              qrKey: qrKey,
              setQRViewController: _scannerCubit.setQRViewController,
              toggleFlash: _scannerCubit.changeFlashMode,
            ),
          ScannerPermissionDeniedState() => const ScannerCameraErrorWidget(),
          ScannerInitial() ||
          ScannerLoading() ||
          _ =>
            const CustomGenericLoadingWidget(),
        },
      ),
    );
  }
}
