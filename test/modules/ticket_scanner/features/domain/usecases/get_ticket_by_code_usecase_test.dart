import 'package:code_bar_reader_base/modules/ticket_scanner/core/errors/ticket_failure.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/repositories/get_ticket_by_code_repository.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/usecases/get_ticket_by_code_usecase.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/usecases/get_ticket_by_code_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/ticket_model_mock.dart';
import '../../../mocks/ticket_module_mock.dart';

void main() {
  late GetTicketByCodeRepository getTicketByCodeRepositoryMock;
  late GetTicketByCodeUsecase getTicketByCodeUsecase;

  setUp(() {
    getTicketByCodeRepositoryMock = GetTicketByCodeRepositoryMock();
    getTicketByCodeUsecase = GetTicketByCodeUsecaseImpl(
      getTicketByCodeRepository: getTicketByCodeRepositoryMock,
    );
  });

  test(
      'Deve retornar um TicketEntity quando a chamado ao repository for bem sucedida',
      () async {
    when(() => getTicketByCodeRepositoryMock(code: ticketModelMock.code))
        .thenAnswer((_) async => Right(ticketModelMock));

    final result = await getTicketByCodeUsecase(code: ticketModelMock.code);

    verify(() => getTicketByCodeRepositoryMock(code: ticketModelMock.code))
        .called(1);
    expect(result, isA<Right>());
    expect(result, Right(ticketModelMock));
  });

  test('Deve retornar um Failure se ocorrer uma falha no repository', () async {
    final failure = TicketFailure();
    when(() => getTicketByCodeRepositoryMock(code: ticketModelMock.code))
        .thenAnswer((_) async => Left(failure));

    final result = await getTicketByCodeUsecase(code: ticketModelMock.code);

    verify(() => getTicketByCodeRepositoryMock(code: ticketModelMock.code))
        .called(1);
    expect(result, Left(failure));
  });
}
