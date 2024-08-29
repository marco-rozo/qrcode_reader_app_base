import 'package:code_bar_reader_base/core/errors/failures.dart';

final class UnknownFailure extends Failure {
  UnknownFailure({
    super.message,
    super.stackTrace,
  });
}
