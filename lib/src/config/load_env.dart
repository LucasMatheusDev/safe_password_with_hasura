import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoadEnv {
  Future load() async {
    await dotenv.load(fileName: ".env");
  }
}
