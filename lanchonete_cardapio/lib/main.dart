import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lanchonete_cardapio/app/core/bindings/application_bindings.dart';
import 'package:lanchonete_cardapio/app/core/ui/vakinha_ui.dart';
import 'package:lanchonete_cardapio/app/routes/auth_routers.dart';
import 'package:lanchonete_cardapio/app/routes/splash_routes.dart';


void main() {
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      title: 'Vakinha Burger',
      theme: VakinhaUI.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers
      ],

    );
  
  }
}
