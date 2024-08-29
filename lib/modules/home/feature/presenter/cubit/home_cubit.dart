import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> init() async {
    emit(HomeLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(HomeSuccess());
  }
}
