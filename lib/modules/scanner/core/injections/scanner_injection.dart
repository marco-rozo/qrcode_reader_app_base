import 'package:code_bar_reader_base/core/externals/permission_manager/permission_manager.dart';
import 'package:code_bar_reader_base/core/externals/permission_manager/permission_manager_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ScannerInjection {
  static List<RepositoryProvider> get repositoryProvider => [
        RepositoryProvider<PermissionManager>(
          create: (context) => PermissionManagerImpl(),
        ),
      ];
}
