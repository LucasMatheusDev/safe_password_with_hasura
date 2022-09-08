import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_password_with_hasura/modules/login/view/login/login_controller.dart';
import 'package:safe_password_with_hasura/src/theme/custom_style_form.dart';

class RegisterNewUserComponent extends GetView<LoginController> {
  const RegisterNewUserComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
      child: Form(
        key: controller.formKeyRegister,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Preencha os campos",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.emailController,
              validator: (value) => controller.emailValidator(
                value: value,
              ),
              style: const TextStyle(color: Colors.white),
              decoration: CustomStyleForm().roundedBorder(
                label: "Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              validator: (value) => controller.defaultValidator(
                value: value,
              ),
              style: const TextStyle(color: Colors.white),
              decoration: CustomStyleForm().roundedBorder(
                label: "password",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.nicknameController,
              validator: (value) => controller.defaultValidator(
                value: value,
              ),
              style: const TextStyle(color: Colors.white),
              decoration: CustomStyleForm().roundedBorder(
                label: "NickName",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : FloatingActionButton.extended(
                      heroTag: "register button",
                      onPressed: () => controller.registerNewUser(),
                      label: const Text("Register"),
                      backgroundColor: Colors.red.withOpacity(0.8),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
