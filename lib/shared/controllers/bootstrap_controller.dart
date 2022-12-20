import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class BootstrapController extends GetxController {
  final Rx<ScrollDirection> scrollDirection = ScrollDirection.forward.obs;
  final Rx<bool> scrollIsForward = true.obs;

  void setScrollIsForward(bool isForward) {
    scrollIsForward.value = isForward;
  }
}
