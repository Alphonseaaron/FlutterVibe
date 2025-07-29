import 'package:flutter/foundation.dart';

enum LogLevel { verbose, debug, info, warning, error }

class Logger {
  static LogLevel logLevel = kDebugMode ? LogLevel.verbose : LogLevel.warning;

  static void verbose(String message) {
    if (logLevel.index <= LogLevel.verbose.index) {
      print('[VERBOSE] $message');
    }
  }

  static void debug(String message) {
    if (logLevel.index <= LogLevel.debug.index) {
      print('[DEBUG] $message');
    }
  }

  static void info(String message) {
    if (logLevel.index <= LogLevel.info.index) {
      print('[INFO] $message');
    }
  }

  static void warning(String message) {
    if (logLevel.index <= LogLevel.warning.index) {
      print('[WARNING] $message');
    }
  }

  static void error(String message, [dynamic error]) {
    if (logLevel.index <= LogLevel.error.index) {
      print('[ERROR] $message');
      if (error != null) {
        print(error);
      }
    }
  }
}
