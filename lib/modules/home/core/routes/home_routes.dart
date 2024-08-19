import 'package:code_bar_reader_base/core/routes/app_named_routes.dart';
import 'package:code_bar_reader_base/modules/home/feature/presenter/cubit/home_cubit.dart';
import 'package:code_bar_reader_base/modules/home/feature/presenter/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class HomeRoutes {
  static List<GoRoute> get routes => [
        GoRoute(
          name: AppNamedRoutes.home,
          path: AppNamedRoutes.home,
          builder: (BuildContext context, GoRouterState state) =>
              BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
            child: const HomePage(),
          ),
        )
      ];
}
