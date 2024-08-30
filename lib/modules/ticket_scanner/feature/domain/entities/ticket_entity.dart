class TicketEntity {
  final String id;
  final String code;
  final String title;

  TicketEntity({
    required this.id,
    required this.code,
    required this.title,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TicketEntity &&
        other.id == id &&
        other.code == code &&
        other.title == title;
  }

  @override
  int get hashCode {
    return id.hashCode ^ code.hashCode ^ title.hashCode;
  }

  factory TicketEntity.empty() {
    return TicketEntity(
      id: '',
      code: '',
      title: '',
    );
  }

  TicketEntity copyWith({
    String? id,
    String? code,
    String? title,
  }) {
    return TicketEntity(
      id: id ?? this.id,
      code: code ?? this.code,
      title: title ?? this.title,
    );
  }
}
