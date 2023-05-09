import 'dart:math';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lanchonete_cardapio/app/core/mixins/loader_mixin.dart';
import 'package:lanchonete_cardapio/app/core/mixins/messages_mixin.dart';
import 'package:lanchonete_cardapio/app/core/rest_client/rest_client.dart';
import 'package:lanchonete_cardapio/app/models/user_model.dart';
import 'package:lanchonete_cardapio/app/repositores/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;

  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListerner(_loading);
    messageListerner(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      await _authRepository.register(name, email, password);
      _loading.toggle();
      _message(MessageModel(
        title: 'Sucesso',
        message: 'Cadastro realizado com sucesso',
        type: MessageType.info,
      ));
    } on RestClientException catch (e, s) {
      _loading.toggle();
      throw ('Erro ao registrar Login: $e$s');
    } catch (e) {
      _message(MessageModel(
          title: 'error',
          message: 'Erro ao registrr usuário',
          type: MessageType.error));
    }

    // void qualquer() {
    //   message.value = MessageModel(
    //       title: 'Teste', message: 'Teste Mesnage', type: MessageType.error);
    //   loading.toggle();
    //   Future.delayed(const Duration(seconds: 2), () => loading.toggle());
    //
  }
}
