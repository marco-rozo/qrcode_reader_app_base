import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_bar_reader_base/core/externals/permission_manager/permission_manager.dart';
import 'package:code_bar_reader_base/core/externals/permission_manager/permission_manager_impl.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/data/datasources/get_ticket_by_code_datasource.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/data/datasources/get_ticket_by_code_datasource_impl.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/data/repositories/get_ticket_by_code_repository_impl.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/domain/repositories/get_ticket_by_code_repository.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/domain/usecases/get_ticket_by_code_usecase.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/domain/usecases/get_ticket_by_code_usecase_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ScannerInjection {
  static List<RepositoryProvider> get repositoryProvider => [
        RepositoryProvider<GetTicketByCodeDatasource>(
          create: (context) => GetTicketByCodeDatasourceImpl(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        RepositoryProvider<GetTicketByCodeRepository>(
          create: (context) => GetTicketByCodeRepositoryImpl(
            getTicketByCodeDatasource:
                context.read<GetTicketByCodeDatasource>(),
          ),
        ),
        RepositoryProvider<GetTicketByCodeUsecase>(
          create: (context) => GetTicketByCodeUsecaseImpl(
            getTicketByCodeRepository:
                context.read<GetTicketByCodeRepository>(),
          ),
        ),
        RepositoryProvider<PermissionManager>(
          create: (context) => PermissionManagerImpl(),
        ),
      ];
}
