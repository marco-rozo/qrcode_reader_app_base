import 'package:code_bar_reader_base/core/errors/failures.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/entities/ticket_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetTicketByCodeUsecase {
  Future<Either<Failure, TicketEntity>> call({required String code});
}
