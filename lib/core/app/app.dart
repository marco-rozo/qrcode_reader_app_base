import 'package:code_bar_reader_base/core/injections/app_injections.dart';
import 'package:code_bar_reader_base/core/routes/app_routes.dart';
import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: Appinjections.repositoryProviders,
        child: MaterialApp.router(
          routerConfig: AppRoutes.routes,
          onGenerateTitle: (context) => 'Code Bar Reader',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
          ),
          // theme: theme,
        ));
  }
}
