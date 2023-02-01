import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName =>
      kReleaseMode ? '.env.production' : '.env.development';
  static String get test => dotenv.env['TEST'] ?? fallbackMessage('TEST');

  static String get apiBaseUrl =>
      dotenv.env['API_BASE_URL'] ?? fallbackMessage('API_BASE_URL');
  static String get apiConnectionTimeout =>
      dotenv.env['API_CONNECTION_TIMEOUT'] ??
      fallbackMessage('API_CONNECTION_TIMEOUT');
  static String get apiReceiveTimeout =>
      dotenv.env['API_RECEIVE_TIMEOUT'] ??
      fallbackMessage('API_RECEIVE_TIMEOUT');

  static String fallbackMessage(String target) =>
      '$target not found in $fileName';
}
