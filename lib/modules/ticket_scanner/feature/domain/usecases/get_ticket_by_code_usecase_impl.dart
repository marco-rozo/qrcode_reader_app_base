import 'package:code_bar_reader_base/core/errors/failures.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/entities/ticket_entity.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/repositories/get_ticket_by_code_repository.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/usecases/get_ticket_by_code_usecase.dart';
import 'package:dartz/dartz.dart';

class GetTicketByCodeUsecaseImpl implements GetTicketByCodeUsecase {
  final GetTicketByCodeRepository _getTicketByCodeRepository;

  GetTicketByCodeUsecaseImpl({
    required GetTicketByCodeRepository getTicketByCodeRepository,
  }) : _getTicketByCodeRepository = getTicketByCodeRepository;

  @override
  Future<Either<Failure, TicketEntity>> call({required String code}) async {
    return _getTicketByCodeRepository(code: code);
  }
}
