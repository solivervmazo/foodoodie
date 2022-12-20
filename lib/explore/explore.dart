import 'package:get/get.dart';

export 'explore_screen.dart';

class Explore {
  static String get routeName => "/explore";
  static _Routes get go => const _Routes();
}

class _Routes {
  const _Routes();

  void explore() {
    Get.toNamed(Explore.routeName);
  }
}
