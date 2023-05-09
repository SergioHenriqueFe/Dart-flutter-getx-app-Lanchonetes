import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lanchonete_cardapio/app/modules/auth/register/register_controller.dart';

import '../../../core/ui/vakinha_ui.dart';
import '../../../core/ui/widgets/vakinha_appbar.dart';
import '../../../core/ui/widgets/vakinha_button.dart';
import '../../../core/ui/widgets/vakinha_textformfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColorDark,
                  ),
                ),
                Text(
                  'Preencha o cadastro abaixo para criar a sua conta',
                  style: context.textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextFormfield(label: 'Nome'),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextFormfield(label: 'E-mail'),
                const SizedBox(
                  height: 30,
                ),
                const VakinhaTextFormfield(label: 'Senha'),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextFormfield(label: 'Confirma senha'),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: VakinhaButton(
                    label: 'Cadastrar',
                    onPressed: (() {
                      //Get.find<RegisterController>().qualquer();
                    }),
                    width: context.width,
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
