import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lanchonete_cardapio/app/core/constants/constants.dart';
import 'package:lanchonete_cardapio/app/core/exceptions/user_notfound_exceptions.dart';
import 'package:lanchonete_cardapio/app/core/mixins/loader_mixin.dart';
import 'package:lanchonete_cardapio/app/core/mixins/messages_mixin.dart';
import 'package:lanchonete_cardapio/app/repositores/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListerner(_loading);
    messageListerner(_message);
    super.onInit();
  }

  Future<void> login({
    required String email,
    required String password,
    }) async {
    try {
      _loading.toggle();
      final userLoggerd = _authRepository.login(email, password);

      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLoggerd);

      _loading.toggle();
    } on UserNotFoundException catch (e, s) {
      _loading.toggle();
      log('Login ou senha inválidos', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Login ou senha inválidos',
            type: MessageType.error),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao realizar login', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao realizar login',
            type: MessageType.error),
      );
    }
  }
}
