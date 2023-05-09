import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lanchonete_cardapio/app/core/ui/vakinha_state.dart';
import 'package:lanchonete_cardapio/app/core/ui/vakinha_ui.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:validatorless/validatorless.dart';
import 'package:get/get.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_button.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:lanchonete_cardapio/app/modules/auth/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends VakinhaState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
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
      body: LayoutBuilder(
        builder: (_, Constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: IntrinsicHeight(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          VakinhaTextFormfield(
                            label: 'E-mail',
                            controller: _emailEC,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.required('E-mail Obrigatório'),
                                Validatorless.email('E-mail inválido'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          VakinhaTextFormfield(
                            label: 'Senha',
                            obscureText: true,
                            controller: _passwordEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória'),
                              Validatorless.min(6,
                                  'Senha deve conter pelo menos 6 caractéries')
                            ]),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: VakinhaButton(
                              label: 'Etrar',
                              onPressed: (() {
                                final formValid =
                                    _formKey.currentState?.validate() ?? false;
                                    if(formValid){
                                      
                                    }
                                }),
                              width: context.width,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não possui uma conta?'),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/auth/register');
                                },
                                child: Text(
                                  'Cadastre-se',
                                  style: VakinhaUI.textBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
