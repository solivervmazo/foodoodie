import 'package:get/get.dart';

export 'profile_screen.dart';

class Profile {
  static String get routeName => "/profile";

  static _Routes get go => const _Routes();
}

class _Routes {
  const _Routes();

  void profile() {
    Get.toNamed(Profile.routeName);
  }
}
