import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static String? get apiUrl => dotenv.env['API_URL'];
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
}
