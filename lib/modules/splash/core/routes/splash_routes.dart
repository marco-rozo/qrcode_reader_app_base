import 'package:code_bar_reader_base/core/routes/app_named_routes.dart';
import 'package:code_bar_reader_base/modules/splash/feature/presenter/cubit/splash_cubit.dart';
import 'package:code_bar_reader_base/modules/splash/feature/presenter/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class SplashRoutes {
  static List<GoRoute> get routes => [
        GoRoute(
          name: AppNamedRoutes.splash,
          path: AppNamedRoutes.splash,
          builder: (BuildContext context, GoRouterState state) =>
              BlocProvider<SplashCubit>(
            create: (context) => SplashCubit(),
            child: const SplashPage(),
          ),
        )
      ];
}
