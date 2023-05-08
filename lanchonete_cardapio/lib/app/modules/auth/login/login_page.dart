import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lanchonete_cardapio/app/core/ui/vakinha_ui.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:get/get.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_button.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_textformfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, Constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: Constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IntrinsicHeight(
                child: Form(
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
                    VakinhaTextFormfield(label: 'E-mail'),
                    const SizedBox(
                      height: 30,
                    ),
                    const VakinhaTextFormfield(label: 'Senha'),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: VakinhaButton(
                        label: 'Etrar',
                        onPressed: (() {}),
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
          );
        },
      ),
    );
  }
}
