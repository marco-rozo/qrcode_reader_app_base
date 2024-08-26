import 'package:code_bar_reader_base/modules/scanner/core/injections/scanner_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class Appinjections {
  static List<RepositoryProvider> get repositoryProviders => [
        ...ScannerInjection.repositoryProvider,
      ];
}
