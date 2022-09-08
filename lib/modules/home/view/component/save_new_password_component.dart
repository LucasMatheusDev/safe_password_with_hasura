import 'package:flutter/material.dart';
import 'package:safe_password_with_hasura/modules/home/model/entities/password_dto.dart';
import 'package:safe_password_with_hasura/src/routes/custom_navigator.dart';

class SaveNewPasswordComponent extends StatelessWidget {
  final void Function(PasswordDto password) onSave;
  const SaveNewPasswordComponent({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    final applicationNameController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return AlertDialog(
      title: const Text("Digite as informações da senha"),
      content: Form(
        key: formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextFormField(
            controller: applicationNameController,
            validator: (value) =>
                value!.isEmpty ? "Este campo não pode ser vazio" : null,
            decoration: const InputDecoration(
              label: Text("Application Name"),
            ),
          ),
          TextFormField(
            controller: passwordController,
            validator: (value) =>
                value!.isEmpty ? "Este campo não pode ser vazio" : null,
            decoration: const InputDecoration(
              label: Text("Password"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onSave(
                    PasswordDto(
                      value: passwordController.text.toString(),
                      applicationName:
                          applicationNameController.text.toString(),
                    ),
                  );
                  CustomNavigator().back();
                }
              },
              child: const Text("Salvar"))
        ]),
      ),
    );
  }
}
