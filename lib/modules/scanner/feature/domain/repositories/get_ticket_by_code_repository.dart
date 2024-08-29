import 'package:code_bar_reader_base/core/errors/failures.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/domain/entities/ticket_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetTicketByCodeRepository {
  Future<Either<Failure, TicketEntity>> call({required String code});
}
