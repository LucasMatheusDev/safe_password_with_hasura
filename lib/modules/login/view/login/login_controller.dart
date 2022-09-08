import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:safe_password_with_hasura/modules/login/model/dto/user_login_dto.dart';
import 'package:safe_password_with_hasura/modules/login/model/dto/user_new_register_dto.dart';
import 'package:safe_password_with_hasura/modules/login/view_model/login_view_model.dart';
import 'package:safe_password_with_hasura/src/domain/entities/user.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();

  final PageController pageController = PageController();

  RxBool isLoading = false.obs;

  final LoginViewModel _loginViewModel;

  LoginController({
    required LoginViewModel loginViewModel,
  }) : _loginViewModel = loginViewModel;

  Future<void> login() async {
    if (formKeyLogin.currentState!.validate()) {
      changeStateLoading();
      await _loginViewModel.login(
        user: _createLoginUser(),
      );
      changeStateLoading();
    }
  }

  Future<void> registerNewUser() async {
    if (formKeyRegister.currentState!.validate()) {
      changeStateLoading();
      await _loginViewModel.registerAndToHome(
        user: _createRegisterUser(),
      );
      changeStateLoading();
    }
  }

  void changeStateLoading() {
    isLoading.value = !isLoading.value;
    update();
  }

  UserEntity _createLoginUser() {
    return UserLoginDto(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  UserNewRegisterDto _createRegisterUser() {
    return UserNewRegisterDto(
      email: emailController.text,
      password: passwordController.text,
      nickname: nicknameController.text,
    );
  }

  String? defaultValidator({required String? value}) {
    if (value == null || value.isEmpty) {
      return "Este Campo obrigatório";
    } else {
      return null;
    }
  }

  String? emailValidator({required String? value}) {
    if (GetUtils.isEmail(value ?? "")) {
      return null;
    } else {
      return "Este email não é válido";
    }
  }
}
