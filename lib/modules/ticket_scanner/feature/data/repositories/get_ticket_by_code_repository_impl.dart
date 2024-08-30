import 'package:code_bar_reader_base/core/errors/failures.dart';
import 'package:code_bar_reader_base/core/errors/failures/unknown_failure.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/data/datasources/get_ticket_by_code_datasource.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/entities/ticket_entity.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/repositories/get_ticket_by_code_repository.dart';
import 'package:dartz/dartz.dart';

class GetTicketByCodeRepositoryImpl implements GetTicketByCodeRepository {
  final GetTicketByCodeDatasource _getTicketByCodeDatasource;

  GetTicketByCodeRepositoryImpl({
    required GetTicketByCodeDatasource getTicketByCodeDatasource,
  }) : _getTicketByCodeDatasource = getTicketByCodeDatasource;
  @override
  Future<Either<Failure, TicketEntity>> call({required String code}) async {
    try {
      final result = await _getTicketByCodeDatasource(code: code);
      return Right(result);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
