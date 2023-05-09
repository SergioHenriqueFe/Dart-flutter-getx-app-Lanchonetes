import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class VakinhaState<S extends StatefulWidget, C extends GetxController>
    extends State<S> {
  C get controller => Get.find();
}
