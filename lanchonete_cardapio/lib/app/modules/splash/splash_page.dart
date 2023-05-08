import 'package:flutter/material.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_button.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
  
      ),
      body: Column(
        children: [
           const SizedBox(
             height: 10,
          ),
          const Padding(
        padding:  EdgeInsets.all(8.0),
        child: VakinhaTextFormfield(label: 'Text Form',),
      ),
        const SizedBox(
           height: 20,
        ),
        VakinhaButton(label: 'Entrar', onPressed: () {}),
      ],),
    );
  }
}
