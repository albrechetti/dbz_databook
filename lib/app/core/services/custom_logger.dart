import 'package:logger/logger.dart';

class AppLogger extends Logger {
  static final important = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );
}
