import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lanchonete_cardapio/app/core/ui/vakinha_state.dart';
import 'package:lanchonete_cardapio/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';
import '../../../core/ui/vakinha_ui.dart';
import '../../../core/ui/widgets/vakinha_appbar.dart';
import '../../../core/ui/widgets/vakinha_button.dart';
import '../../../core/ui/widgets/vakinha_textformfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
     
    super.dispose();
  }

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
                key: _formKey,
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
                    VakinhaTextFormfield(
                      label: 'Nome',
                      controller: _nameEC,
                      validator: Validatorless.required('Nome Obrigatório'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextFormfield(
                      label: 'E-mail',
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido')
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextFormfield(
                      label: 'Senha',
                      controller: _passwordEC,
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha obrigatório'),
                        Validatorless.min(
                            6, 'Senha deve conter pelo menos 6 caractéries'),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VakinhaTextFormfield(
                      label: 'Confirma senha',
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Confirma senha obrigatório'),
                        Validatorless.compare(
                            _passwordEC, 'senha não corresponde')
                      ]),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: VakinhaButton(
                        label: 'Cadastrar',
                        onPressed: (() {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            controller.register(
                                name: _nameEC.text,
                                email: _emailEC.text,
                                password: _passwordEC.text);
                          }
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
