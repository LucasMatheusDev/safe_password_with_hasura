
import 'package:get/get.dart';
import 'package:safe_password_with_hasura/modules/splash_screen/view_model/splash_screen_view_model.dart';
import 'package:safe_password_with_hasura/src/config/analytics_error.dart';
import 'package:safe_password_with_hasura/src/config/firebase_initialize.dart';
import 'package:safe_password_with_hasura/src/config/load_env.dart';

/// This is the initial binding for the application
/// It is responsible for initializing the dependencies
/// application initials
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AnalyticsError>(
      AnalyticsError(),
    );
    Get.put<FirebaseInitialize>(
      FirebaseInitialize(),
    );
    Get.put<LoadEnv>(
      LoadEnv(),
    );
    Get.put<SplashScreenViewModel>(
      SplashScreenViewModel(),
    );
  }
}
