
part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SplashInitial extends SplashState {}
final class SplashLoading extends SplashState {}
final class SplashSuccess extends SplashState {}

final class SplashError extends SplashState {
  final String message;

  SplashError({required this.message});
}
