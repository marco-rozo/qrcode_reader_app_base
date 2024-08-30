import 'package:code_bar_reader_base/core/externals/permission_manager/permission_manager.dart';
import 'package:code_bar_reader_base/core/routes/app_named_routes.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/usecases/get_ticket_by_code_usecase.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/presenter/cubit/ticket_scanner_cubit.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/presenter/page/ticket_scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class TicketScannerRoutes {
  static List<GoRoute> get routes => [
        GoRoute(
          name: AppNamedRoutes.ticketScanner,
          path: AppNamedRoutes.ticketScanner,
          builder: (BuildContext context, GoRouterState state) =>
              BlocProvider<TicketScannerCubit>(
            create: (context) => TicketScannerCubit(
              permissionManager: context.read<PermissionManager>(),
              getTicketByCodeUsecase: context.read<GetTicketByCodeUsecase>(),
            ),
            child: const TicketScannerPage(),
          ),
        )
      ];
}
