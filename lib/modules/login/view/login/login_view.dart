import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:safe_password_with_hasura/modules/login/view/components/register_new_user_component.dart';
import 'package:safe_password_with_hasura/modules/login/view/login/login_controller.dart';
import 'package:safe_password_with_hasura/src/theme/custom_style_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: controller.pageController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Lottie.asset(
                  "assets/big_phone.json",
                  height: 300,
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.03),
                      child: Form(
                        key: controller.formKeyLogin,
                        child: Column(
                          children: [
                            Text(
                              "Safe Password",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                            const Text(
                              "With Hasura",
                              style: TextStyle(
                                fontSize: 30,
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
                                label: "Password",
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Obx(
                              () => controller.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FloatingActionButton.extended(
                                          onPressed: controller.login,
                                          label: const Text("Login"),
                                          heroTag: "logar",
                                        ),
                                        FloatingActionButton.extended(
                                          heroTag: "register",
                                          onPressed: () => controller
                                              .pageController
                                              .nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOutCubic,
                                          ),
                                          label: Row(
                                            children: const [
                                              Text("New User"),
                                              Icon(Icons.arrow_forward),
                                            ],
                                          ),
                                          backgroundColor:
                                              Colors.red.withOpacity(0.8),
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const RegisterNewUserComponent()
        ],
      ),
    );
  }
}
