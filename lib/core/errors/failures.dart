abstract class Failure {
  final String? message;
  final StackTrace? stackTrace;

  Failure({
    this.message,
    this.stackTrace,
  });

  @override
  String toString() {
    return 'Failure: $message';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure &&
        other.message == message &&
        other.stackTrace == stackTrace;
  }

  @override
  int get hashCode => message.hashCode ^ stackTrace.hashCode;
}
