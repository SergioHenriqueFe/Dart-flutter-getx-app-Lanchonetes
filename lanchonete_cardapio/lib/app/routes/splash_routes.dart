import 'package:get/get_navigation/get_navigation.dart';
import 'package:lanchonete_cardapio/app/modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();
  static final routers = <GetPage>[
    GetPage(name: '/', page:() => const SplashPage(),),
  ];
}
