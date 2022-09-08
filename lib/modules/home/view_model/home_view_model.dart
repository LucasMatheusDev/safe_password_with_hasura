import 'package:safe_password_with_hasura/modules/home/model/entities/password_dto.dart';
import 'package:safe_password_with_hasura/src/domain/interface/repositories/home_repository.dart';
import 'package:safe_password_with_hasura/src/routes/custom_navigator.dart';
import 'package:safe_password_with_hasura/src/routes/named_routes.dart';
import 'package:safe_password_with_hasura/src/utils/mixin/alerts_snackbar_mixin.dart';

class HomeViewModel with AlertsSnackbarMixin {
  final IHomeRepository _homeRepository;

  HomeViewModel({required IHomeRepository homeRepository})
      : _homeRepository = homeRepository;

  Future<List<PasswordDto>?> getPasswords() async {
    try {
      return await _homeRepository.getSavePasswords() as List<PasswordDto>;
    } catch (error) {
      showErrorSnackBar(
        message: "Erro ao obter as senhas",
        errorMessage: error.toString(),
      );
      return null;
    }
  }

  Future<bool> saveNewPassword({required PasswordDto password}) async {
    try {
      final result = await _homeRepository.saveNewPassword(
          applicationName: password.applicationName, password: password.value);
      if (result != null) {
        showSuccessSnackBar(message: "Senha salva com sucesso");
        return true;
      } else {
        showErrorSnackBar(
          message: "erro ao tentar salvar a senha",
          errorMessage: "",
        );
        return false;
      }
    } catch (error) {
      showErrorSnackBar(
        message: "Erro ao salvar a senha",
        errorMessage: error.toString(),
      );
      return false;
    }
  }

  Future<bool> deletePassword({required PasswordDto password}) async {
    try {
      final result = await _homeRepository.deletedPassword(
          applicationName: password.applicationName, password: password.value);
      if (result != null) {
        showSuccessSnackBar(message: "Senha deletada com sucesso");
        return true;
      } else {
        showErrorSnackBar(
          message: "erro ao tentar apagar a senha",
          errorMessage: "",
        );
        return false;
      }
    } catch (error) {
      showErrorSnackBar(
        message: "Erro ao apagar a senha",
        errorMessage: error.toString(),
      );
      return false;
    }
  }

  Future logout() async {
    try {
      await _homeRepository.logout();
      CustomNavigator().offNamed(newRouteName: NamedRoutes.login);
    } catch (error) {
      showErrorSnackBar(
        message: "Erro ao Fazer logout",
        errorMessage: error.toString(),
      );
      return null;
    }
  }
}
