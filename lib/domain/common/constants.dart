import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants{
  static String mainName = dotenv.env['MainTitle']!;
  static String keyW = dotenv.env['KeyW']!;
  static String keyK = dotenv.env['KeyK']!;
}