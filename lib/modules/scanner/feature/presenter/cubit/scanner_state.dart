part of 'scanner_cubit.dart';

sealed class ScannerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ScannerInitial extends ScannerState {}

final class ScannerLoading extends ScannerState {}

final class ScannerSuccess extends ScannerState {}

final class ScannerError extends ScannerState {
  final String message;

  ScannerError({required this.message});
}

final class ScannedSucess extends ScannerState {}

final class ScannerPermissionDeniedState extends ScannerState {
  final String message;

  ScannerPermissionDeniedState({required this.message});
}
