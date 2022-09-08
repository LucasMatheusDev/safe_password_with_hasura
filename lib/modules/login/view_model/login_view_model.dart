import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safe_password_with_hasura/modules/login/model/dto/user_new_register_dto.dart';
import 'package:safe_password_with_hasura/src/domain/entities/user.dart';
import 'package:safe_password_with_hasura/src/domain/interface/repositories/login_repository.dart';
import 'package:safe_password_with_hasura/src/routes/custom_navigator.dart';
import 'package:safe_password_with_hasura/src/routes/named_routes.dart';
import 'package:safe_password_with_hasura/src/utils/helper/firebase_auth_error_translator_helper.dart';
import 'package:safe_password_with_hasura/src/utils/mixin/alerts_snackbar_mixin.dart';

class LoginViewModel with AlertsSnackbarMixin {
  final ILoginRepository _loginRepository;

  LoginViewModel({
    required ILoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  Future<void> login({required UserEntity user}) async {
    try {
      final result = await _loginRepository.login(
        user: user,
      );
      if (result != null) {
        goToHomePage();
      }
    } on FirebaseAuthException catch (e) {
      return showErrorSnackBar(
        message:
            FirebaseAuthErrorTranslator().erroTranslator(errorCode: e.code),
        errorMessage: e.toString(),
      );
    } catch (e) {
      return showErrorSnackBar(
        message: "Tivemos um problema ao fazer o registro",
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> registerAndToHome({required UserNewRegisterDto user}) async {
    try {
      final result = await _loginRepository.register(
        user: user,
      );
      if (result != null) {
        goToHomePage();
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return showErrorSnackBar(
        message:
            FirebaseAuthErrorTranslator().erroTranslator(errorCode: e.code),
        errorMessage: e.toString(),
      );
    } catch (e) {
      return  showErrorSnackBar(
        message: "Tivemos um problema ao registrar seu usuário",
        errorMessage: e.toString(),
      );
    }
  }

  void goToHomePage() =>
      CustomNavigator().offNamed(newRouteName: NamedRoutes.home);
}
