part of 'ticket_scanner_cubit.dart';

sealed class TicketScannerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class TicketScannerInitial extends TicketScannerState {}

final class TicketScannerLoading extends TicketScannerState {}

final class TicketScannerSuccess extends TicketScannerState {}

final class TicketScannerError extends TicketScannerState {
  final String message;

  TicketScannerError({required this.message});
}

final class TicketScannedSucess extends TicketScannerState {}

final class ScannerPermissionDeniedState extends TicketScannerState {
  final String message;

  ScannerPermissionDeniedState({required this.message});
}
