import 'package:code_bar_reader_base/modules/ticket_scanner/feature/domain/entities/ticket_entity.dart';

class TicketModel extends TicketEntity {
  TicketModel({
    required super.id,
    required super.code,
    required super.title,
  });

  factory TicketModel.fromMap(Map<String, dynamic> json) {
    return TicketModel(
      code: json['code'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'id': id,
      'title': title,
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
