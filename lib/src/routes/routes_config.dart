import 'package:get/get.dart';
import 'package:safe_password_with_hasura/modules/home/view/home_view.dart';
import 'package:safe_password_with_hasura/modules/login/view/login/login_view.dart';
import 'package:safe_password_with_hasura/modules/splash_screen/splash_screen_view.dart';
import 'package:safe_password_with_hasura/src/bindings/home_bindings.dart';
import 'package:safe_password_with_hasura/src/bindings/login_bindings.dart';

/// This Class is responsible for configuring all pages of the application,
/// adding the corresponding bindings to the pages and setting the routes.
class RoutesConfig {
  List<GetPage> getPages() {
    return [
      GetPage(
        name: '/',
        page: () => const SplashScreenView(),
      ),
      GetPage(
        name: '/home',
        page: () => const HomeView(),
        binding: HomeBindings(),
      ),
      GetPage(
        name: '/login',
        page: () => const LoginView(),
        binding: LoginBindings(),
      ),
    ];
  }

  List<String> getPageNames() {
    return getPages().map((GetPage page) => page.name).toList();
  }
}
