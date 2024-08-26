import 'package:code_bar_reader_base/core/externals/permission_manager/permission_manager.dart';
import 'package:code_bar_reader_base/core/routes/app_named_routes.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/presenter/cubit/scanner_cubit.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/presenter/page/scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class ScannerRoutes {
  static List<GoRoute> get routes => [
        GoRoute(
          name: AppNamedRoutes.scanner,
          path: AppNamedRoutes.scanner,
          builder: (BuildContext context, GoRouterState state) =>
              BlocProvider<ScannerCubit>(
            create: (context) => ScannerCubit(
              permissionManager: context.read<PermissionManager>(),
            ),
            child: const ScannerPage(),
          ),
        )
      ];
}
