import 'package:flutter_dotenv/flutter_dotenv.dart';

Map<String, String> headers = {
  "content-type": "application/json",
  "x-hasura-admin-secret": dotenv.env["HASURA_ADMIN_SECRET"]!
};
