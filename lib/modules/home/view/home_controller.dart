import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:safe_password_with_hasura/modules/home/model/entities/password_dto.dart';
import 'package:safe_password_with_hasura/modules/home/view_model/home_view_model.dart';
import 'package:safe_password_with_hasura/src/utils/mixin/alerts_snackbar_mixin.dart';

class HomeController extends GetxController
    with StateMixin<List<PasswordDto>>, AlertsSnackbarMixin {
  final HomeViewModel _homeViewModel;

  HomeController({required HomeViewModel homeViewModel})
      : _homeViewModel = homeViewModel {
    loadPasswords();
  }

  Future loadPasswords() async {
    change(null, status: RxStatus.loading());
    final passwords = await _homeViewModel.getPasswords();

    if (passwords != null) {
      change(passwords,
          status: passwords.isEmpty ? RxStatus.empty() : RxStatus.success());
    } else {
      change(passwords, status: RxStatus.error());
    }
  }

  Future<void> saveNewPassword({required PasswordDto password}) async {
    change(null, status: RxStatus.loading());
    final wasSuccess = await _homeViewModel.saveNewPassword(password: password);

    if (wasSuccess) {
      loadPasswords();
    } else {
      change(null, status: RxStatus.success());
    }
  }

  Future<void> deletePassword({required PasswordDto password}) async {
    change(null, status: RxStatus.loading());
    final wasSuccess = await _homeViewModel.deletePassword(password: password);

    if (wasSuccess) {
      loadPasswords();
    } else {
      change(null, status: RxStatus.success());
    }
  }

  Future<void> onCopyPasswordTap({required String password}) async {
    try {
      await Clipboard.setData(ClipboardData(text: password));
      showInfoSnackBar(message: "Senha copiada");
    } catch (error) {
      showErrorSnackBar(
        message: "Erro ao copiar a senha",
        errorMessage: error.toString(),
      );
    }
  }

  Future logout() async {
    await _homeViewModel.logout();
  }
}
