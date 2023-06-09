import 'package:flutter/material.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_button.dart';
import 'package:lanchonete_cardapio/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: context.width,
                  child: Image.asset('assets/images/lanche.png',
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                  ),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: 60,
                  ),
                  VakinhaButton(
                    label: 'ACESSAR',
                    onPressed: () {
                      Get.toNamed('/auth/login');
                    },
                    width: context.widthTransformer(reducedBy: 10),
                    heigth: 35,
                    
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
