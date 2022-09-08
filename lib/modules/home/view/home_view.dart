import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_password_with_hasura/modules/home/view/component/save_new_password_component.dart';
import 'package:safe_password_with_hasura/modules/home/view/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Senhas Salvas"),
        centerTitle: true,
        leading: IconButton(
          onPressed: controller.logout,
          icon: const Icon(Icons.logout),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.dialog(
              SaveNewPasswordComponent(
                onSave: (password) =>
                    controller.saveNewPassword(password: password),
              ),
            ),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: controller.obx(
        (passwords) {
          if (passwords != null && passwords.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: controller.loadPasswords,
              child: ListView.builder(
                itemCount: passwords.length,
                itemBuilder: (context, index) {
                  final password = passwords[index];
                  return Column(
                    children: [
                      ColoredBox(
                        color: Colors.black54,
                        child: ListTile(
                          title: Text(
                            "Application Name: ${password.applicationName}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            "Password :  ${password.value}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () => controller.onCopyPasswordTap(
                                password: password.value),
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.white,
                            ),
                          ),
                          leading: IconButton(
                            onPressed: () => controller.deletePassword(
                              password: password,
                            ),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                        height: 3,
                      )
                    ],
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Tivemos um erro ao obter as senhas",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            );
          }
        },
        onEmpty: const Center(
          child: Text("Não encontramos nenhuma senha",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        onError: (error) => const Center(
          child: Text(
            "Tivemos um erro ao obter as suas senhas",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
