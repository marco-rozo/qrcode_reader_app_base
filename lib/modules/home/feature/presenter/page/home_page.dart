import 'package:code_bar_reader_base/core/theme/components/custom_generic_loading.dart/custom_generic_loading_widget.dart';
import 'package:code_bar_reader_base/modules/home/feature/presenter/cubit/home_cubit.dart';
import 'package:code_bar_reader_base/modules/home/feature/presenter/widget/home_body/home_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _splashCubit;

  @override
  void initState() {
    super.initState();
    _splashCubit = context.read<HomeCubit>()..init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        bloc: _splashCubit,
        listener: (context, state) {
          if (state is HomeError) {
            debugPrint(state.message);
          }
        },
        builder: (_, state) => switch (state) {
          HomeInitial() || HomeLoading() => const Center(
              child: CustomGenericLoadingWidget(),
            ),
          HomeSuccess() => const HomeBodyWidget(),
          HomeError _ => Center(
              child: Text(state.message),
            ),
        },
      ),
    );
  }
}
