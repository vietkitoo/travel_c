import 'package:logger/logger.dart';

class Log {
  Log._();

  static final _logger = Logger();

  static void debug(String? tag, message) {
    if (_isDeveloperMode) {
      _logger.d("$tag: $message");
    }
  }

  static void info(String? tag, message) {
    if (_isDeveloperMode) {
      _logger.i("$tag: $message");
    }
  }

  static void error(
    String? tag,
    message, {
    bool forceCaptureException = false,
  }) {
    if (_isDeveloperMode && !forceCaptureException) {
      _logger.e("$tag: $message");
      return;
    }
  }

  static bool get _isDeveloperMode => true;
}
