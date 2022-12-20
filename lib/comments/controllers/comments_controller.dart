import 'package:foodoodie/dev/test_data.dart';
import 'package:foodoodie/news_feed/news_feed.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController with ScrollMixin {
  final Rx<LoadingStatus> loadingStatus = LoadingStatus.none.obs;
  final int itemsPerPage = 6;
  final RxBool scrollReachedTop = false.obs;
  final RxList<Map<String, dynamic>> comments = <Map<String, dynamic>>[].obs;
  final RxMap<String, dynamic> args = <String, dynamic>{}.obs;

  @override
  void onReady() {
    _getArgs();
    _getcomments(0);
    super.onReady();
  }

  void _getArgs() {
    args.value = Get.arguments ?? <String, dynamic>{}.obs;
  }

  Future<void> _getcomments(int next) {
    if (args["postId"] == null) {
      return Future.delayed(const Duration(milliseconds: 0));
    }
    loadingStatus.value = LoadingStatus.loading;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () {
        comments.addAll(
            testGenerateComments(args["postId"], length: 10, next: next));
        loadingStatus.value = LoadingStatus.success;
        print(comments);
      },
    );
  }

  @override
  Future<void> onEndScroll() {
    return Future.delayed(
      const Duration(seconds: 0),
    );
  }

  @override
  Future<void> onTopScroll() {
    return Future.delayed(
      const Duration(seconds: 0),
    );
  }
}
