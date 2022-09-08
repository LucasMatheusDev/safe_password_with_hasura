import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_password_with_hasura/src/bindings/initial_bindings.dart';
import 'package:safe_password_with_hasura/src/config/analytics_error.dart';
import 'package:safe_password_with_hasura/src/routes/routes_config.dart';
import 'package:safe_password_with_hasura/src/theme/app_theme.dart';

void main() {
  AnalyticsError().zoneGuarded(
    () async {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      getPages: RoutesConfig().getPages(),
      title: 'Safe Password With Hasura',
      theme: AppTheme().themeDefault,
      initialRoute: "/",
    );
  }
}
