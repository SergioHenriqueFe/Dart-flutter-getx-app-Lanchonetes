import 'package:get/get.dart';
import 'package:lanchonete_cardapio/app/core/mixins/loader_mixin.dart';
import 'package:lanchonete_cardapio/app/core/mixins/messages_mixin.dart';
import 'package:lanchonete_cardapio/app/repositores/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final loading = false.obs;

  final message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListerner(loading);
    messageListerner(message);
    super.onInit();
  }

  // void qualquer() {
  //   message.value = MessageModel(
  //       title: 'Teste', message: 'Teste Mesnage', type: MessageType.error);
    //   loading.toggle();
    //   Future.delayed(const Duration(seconds: 2), () => loading.toggle());
    //
  
}
