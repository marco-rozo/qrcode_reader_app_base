import 'package:code_bar_reader_base/modules/ticket_scanner/feature/data/datasources/get_ticket_by_code_datasource.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/repositories/get_ticket_by_code_repository.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/usecases/get_ticket_by_code_usecase.dart';
import 'package:mocktail/mocktail.dart';

class GetTicketByCodeDatasourceMock extends Mock
    implements GetTicketByCodeDatasource {}

class GetTicketByCodeRepositoryMock extends Mock
    implements GetTicketByCodeRepository {}

class GetTicketByCodeUsecaseMock extends Mock
    implements GetTicketByCodeUsecase {}
