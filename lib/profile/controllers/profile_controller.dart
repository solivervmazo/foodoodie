import 'package:get/get.dart';

class ProfileController extends GetxController with ScrollMixin {
  final RxBool scrollingReverse = false.obs;

  @override
  void onInit() {
    scroll.addListener(() => scrollListener());
    super.onInit();
  }

  void scrollListener() {
    print(scroll);
  }

  @override
  Future<void> onEndScroll() {
    return Future.delayed(const Duration(milliseconds: 0));
  }

  @override
  Future<void> onTopScroll() {
    return Future.delayed(const Duration(milliseconds: 0));
  }
}
