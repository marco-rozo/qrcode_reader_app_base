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
}
