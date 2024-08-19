import 'package:code_bar_reader_base/core/routes/app_named_routes.dart';
import 'package:code_bar_reader_base/modules/splash/feature/presenter/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const  SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashCubit _splashCubit;

  @override
  void initState() {
    super.initState();
    _splashCubit = context.read<SplashCubit>()..init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        bloc: _splashCubit,
        // buildWhen: (previous, current) => current is! SplashError,
        listener: (context, state) {
          if (state is SplashError) {
            debugPrint(state.message);
          }
          if (state is SplashSuccess) {
            print("indo para Home");
            context.go(AppNamedRoutes.home);
          }
        },
        builder: (_, state) => switch (state) {
          SplashInitial() || SplashLoading() || SplashSuccess() => const Center(
              child: CircularProgressIndicator(),
            ),
          SplashError _ => Center(
              child: Text(state.message),
            ),
        },
      ),
    );
  }
}
