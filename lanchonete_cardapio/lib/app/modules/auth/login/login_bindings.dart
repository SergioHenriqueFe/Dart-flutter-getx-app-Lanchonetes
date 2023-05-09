import 'package:get/get.dart';
import 'package:lanchonete_cardapio/app/modules/auth/login/login_controller.dart';

import '../../../repositores/auth/auth_repository.dart';
import '../../../repositores/auth/auth_repository_impl.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LoginController(
        authRepository: Get.find(),
      ),
    );
  }
}