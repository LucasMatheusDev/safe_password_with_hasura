import 'package:get/get.dart';
import 'package:safe_password_with_hasura/modules/login/model/repositories/login_repository_imp.dart';
import 'package:safe_password_with_hasura/modules/login/view/login/login_controller.dart';
import 'package:safe_password_with_hasura/modules/login/view_model/login_view_model.dart';
import 'package:safe_password_with_hasura/src/api/hasura_api_service_imp.dart';
import 'package:safe_password_with_hasura/src/domain/interface/repositories/login_repository.dart';
import 'package:safe_password_with_hasura/src/domain/interface/services/api_service.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(
      () => LoginViewModel(
        loginRepository: Get.find(),
      ),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginViewModel: Get.find(),
      ),
    );

    Get.lazyPut<IApiService>(
      () => HasuraApiServiceImp(),
    );
    Get.lazyPut<ILoginRepository>(
      () => LoginRepositoryImp(apiService: Get.find()),
    );
  }
}
