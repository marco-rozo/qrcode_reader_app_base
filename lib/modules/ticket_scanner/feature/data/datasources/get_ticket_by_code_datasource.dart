import 'package:code_bar_reader_base/modules/ticket_scanner/feature/data/models/ticket_model.dart';

abstract class GetTicketByCodeDatasource {
  Future<TicketModel> call({required String code});
}
