import 'package:get/get.dart';
import 'package:safe_password_with_hasura/modules/home/repositories/home_repository_imp.dart';
import 'package:safe_password_with_hasura/modules/home/view/home_controller.dart';
import 'package:safe_password_with_hasura/modules/home/view_model/home_view_model.dart';
import 'package:safe_password_with_hasura/src/api/hasura_api_service_imp.dart';
import 'package:safe_password_with_hasura/src/domain/interface/repositories/home_repository.dart';
import 'package:safe_password_with_hasura/src/domain/interface/services/api_service.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IApiService>(
      () => HasuraApiServiceImp(),
    );
    Get.lazyPut<IHomeRepository>(
      () => HomeRepositoryImp(
        apiService: Get.find(),
      ),
    );
    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(
        homeRepository: Get.find(),
      ),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        homeViewModel: Get.find(),
      ),
    );
  }
}
