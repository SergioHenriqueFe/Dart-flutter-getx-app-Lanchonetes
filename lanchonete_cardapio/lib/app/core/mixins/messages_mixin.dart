// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListerner() {}
}

class MessageModel {
  final String title;
  final String message;
 final MessageType typee;
  MessageModel({
    required this.title,
    required this.message,
    required this.typee,
  });

}
enum MessageType{error,info}
