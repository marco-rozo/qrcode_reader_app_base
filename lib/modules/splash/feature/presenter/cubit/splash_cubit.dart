import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  final int minSplashTimeInSeconds = 3;

  Future<void> init() async {
    emit(SplashLoading());

    await Future.delayed(Duration(seconds: minSplashTimeInSeconds));

    emit(SplashSuccess());
  }
}
