import 'package:code_bar_reader_base/modules/ticket_scanner/core/consts/ticket_consts.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/entities/ticket_entity.dart';

class TicketModel extends TicketEntity {
  TicketModel({
    required super.id,
    required super.code,
    required super.title,
  });

  factory TicketModel.fromMap(Map<String, dynamic> json) {
    return TicketModel(
      code: json[TicketConsts.code],
      id: json[TicketConsts.id],
      title: json[TicketConsts.title],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      TicketConsts.code: code,
      TicketConsts.id: id,
      TicketConsts.title: title,
    };
  }

  factory TicketModel.fromEntity(TicketEntity entity) {
    return TicketModel(
      code: entity.code,
      id: entity.id,
      title: entity.title,
    );
  }
}
