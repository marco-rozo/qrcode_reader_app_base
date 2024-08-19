import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> init() async {
    print("iniciando a Home");

    emit(HomeLoading());

    await Future.delayed(Duration(seconds: 2));
    print("carregou a Home");

    emit(HomeSuccess());
  }
}
