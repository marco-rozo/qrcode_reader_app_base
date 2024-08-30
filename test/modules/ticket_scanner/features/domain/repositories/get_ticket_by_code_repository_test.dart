import 'package:code_bar_reader_base/core/errors/failures/unknown_failure.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/core/errors/ticket_failure.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/data/datasources/get_ticket_by_code_datasource.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/data/repositories/get_ticket_by_code_repository_impl.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/repositories/get_ticket_by_code_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/ticket_model_mock.dart';
import '../../../mocks/ticket_module_mock.dart';

void main() {
  late GetTicketByCodeDatasource getTicketByCodeDatasourceMock;
  late GetTicketByCodeRepository getTicketByCodeRepository;

  setUp(() {
    getTicketByCodeDatasourceMock = GetTicketByCodeDatasourceMock();
    getTicketByCodeRepository = GetTicketByCodeRepositoryImpl(
      getTicketByCodeDatasource: getTicketByCodeDatasourceMock,
    );
  });

  test(
      'Deve retornar um TicketEntity quando a chamado ao datasource for bem sucedida',
      () async {
    when(() => getTicketByCodeDatasourceMock(code: ticketModelMock.code))
        .thenAnswer((_) async => ticketModelMock);

    final result = await getTicketByCodeRepository(code: ticketModelMock.code);

    expect(result, isA<Right>());
    expect(result, Right(ticketModelMock));
  });

  test('Deve retornar um Failure quando a chamado ao datasource der erro',
      () async {
    final failure = TicketFailure();
    when(() => getTicketByCodeDatasourceMock(code: ticketModelMock.code))
        .thenThrow(failure);

    final result = await getTicketByCodeRepository(code: ticketModelMock.code);

    verify(() => getTicketByCodeDatasourceMock(code: ticketModelMock.code))
        .called(1);
    expect(result, Left(failure));
  });

  test(
      'Deve retornar um UnknownFailure quando a chamado ao datasource lançar uma exceção não tratada',
      () async {
    when(() => getTicketByCodeDatasourceMock(code: ticketModelMock.code))
        .thenThrow(Exception());

    final result = await getTicketByCodeRepository(code: ticketModelMock.code);

    verify(() => getTicketByCodeDatasourceMock(code: ticketModelMock.code))
        .called(1);
    expect(result, Left(UnknownFailure()));
  });
}
