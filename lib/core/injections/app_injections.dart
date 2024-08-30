import 'package:code_bar_reader_base/modules/ticket_scanner/core/injections/ticket_scanner_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class Appinjections {
  static List<RepositoryProvider> get repositoryProviders => [
        ...TicketScannerInjection.repositoryProvider,
      ];
}
