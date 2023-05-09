import 'package:get/get.dart';
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

  Future<void> login({required String email, required String password}) async {
    _loading.toggle();
    final userLoggerd = _authRepository.login(email, password);

    
  }
}
