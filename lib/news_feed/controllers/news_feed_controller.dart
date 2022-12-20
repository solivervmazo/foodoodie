import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:foodoodie/dev/test_data.dart';
import 'package:foodoodie/news_feed/controllers/post_controller.dart';
import 'package:foodoodie/shared/controllers/bootstrap_controller.dart';
import 'package:foodoodie/watch/controllers/player_controller.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

enum LoadingStatus { none, loading, success, error }

class NewsFeedController extends GetxController with ScrollMixin {
  final Rx<LoadingStatus> loadingStatus = LoadingStatus.none.obs;
  final int itemsPerPage = 6;
  final RxBool scrollReachedTop = false.obs;
  final RxList<Map<String, dynamic>> posts = <Map<String, dynamic>>[].obs;
  final RxBool scrollIsForward = true.obs;

  late ItemScrollController itemScrollController;
  late ItemPositionsListener itemPositionsListener;

  final BootstrapController bootstrapController =
      Get.find<BootstrapController>();

  int _autoPlayPostIndex = -1;
  int _itemScrollControllerWentForwardCount = 0;
  int _itemScrollControllerWentReverseCount = 0;
  double _itemScrollControllerLastOffset = 0;

  @override
  void onInit() {
    itemScrollController = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create();
    itemPositionsListener.itemPositions.addListener(
      () {
        if (itemPositionsListener.itemPositions.value.isNotEmpty) {
          Iterable<ItemPosition> inView = itemPositionsListener
              .itemPositions.value
              .where((ItemPosition position) =>
                  position.itemTrailingEdge > 0.5 &&
                  position.itemTrailingEdge < 1);

          if (_itemScrollControllerLastOffset >
              itemPositionsListener.itemPositions.value.first.itemLeadingEdge) {
            _itemScrollControllerWentForwardCount++;
          } else {
            _itemScrollControllerWentReverseCount++;
          }

          if (_itemScrollControllerWentForwardCount > 3) {
            _itemScrollControllerWentForwardCount = 2;
            _itemScrollControllerWentReverseCount = 0;
          }
          if (_itemScrollControllerWentReverseCount > 3) {
            _itemScrollControllerWentReverseCount = 2;
            _itemScrollControllerWentForwardCount = 0;
          }

          scrollIsForward.value = _itemScrollControllerWentForwardCount >
              _itemScrollControllerWentReverseCount;

          _itemScrollControllerLastOffset =
              itemPositionsListener.itemPositions.value.first.itemLeadingEdge;
          bootstrapController.setScrollIsForward(scrollIsForward.value);

          if (inView.length == 1 && _autoPlayPostIndex != inView.first.index) {
            _autoPlayPostIndex = inView.first.index;
            playCurrentPost(
              postId: posts[inView.first.index]["docId"],
              shouldPlay: true,
            );
            if (inView.first.index == posts.length - 2) {
              _getPosts(posts.length);
            }
          } else if (inView.isEmpty) {
            playCurrentPost(
              postId: posts[_autoPlayPostIndex]["docId"],
              shouldPlay: false,
            );
          }
        }
      },
    );
    // scroll.addListener(
    //   () => _scrollListener(),
    // );
    super.onInit();
  }

  @override
  void onReady() async {
    await _getPosts(0);
    super.onReady();
  }

  void _scrollListener() {
    scrollIsForward.value =
        scroll.position.userScrollDirection == ScrollDirection.forward;
    bootstrapController.setScrollIsForward(scrollIsForward.value);
  }

  void playCurrentPost({required String postId, bool shouldPlay = false}) {
    if (postId != "") {
      final PlayerController playerController = Get.find<PlayerController>(
        tag: "player_$postId",
      );
      playerController.toggleInPlay("", inPlay: shouldPlay);
    }
  }

  Future<void> _getPosts(int next) async {
    if (loadingStatus.value == LoadingStatus.loading) {
      return Future.delayed(
        const Duration(
          microseconds: 0,
        ),
      );
    }
    loadingStatus.value = LoadingStatus.loading;
    posts.addAll(
      List.generate(
        itemsPerPage,
        (index) => {
          "docId": "",
        },
      ),
    );
    return await Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        // posts.removeRange(next, posts.length);
        if (next != 0) {
          posts.replaceRange(
              next, posts.length, testGeneratePosts(itemsPerPage, next));
        } else {
          // posts.value = testGeneratePosts(itemsPerPage, next);
          posts.replaceRange(
              next, posts.length, testGeneratePosts(itemsPerPage, next));
        }

        assignControllers(posts, next);

        loadingStatus.value = LoadingStatus.none;
      },
    );
  }

  void deleteControllers() {
    for (var post in posts) {
      Get.delete<PlayerController>(tag: 'player_${post['docId']}');
      Get.delete<PostController>(tag: 'post_${post['docId']}');
    }
  }

  void assignControllers(List<Map<String, dynamic>> posts, int next) {
    for (var i = next; i < posts.length; i++) {
      final post = posts[i];
      PlayerController playerController = Get.put<PlayerController>(
        PlayerController(),
        tag: 'player_${post['docId']}',
      );

      playerController.nowPlaying.value = post;
      playerController.setNowPlaying("player_${post["docId"]}", post);
      playerController.nowDisplayingUrl.value = post["cover"];

      PostController postController = Get.put<PostController>(
        PostController(),
        tag: "post_${post["docId"]}",
      );
      postController.setPost("post_${post["docId"]}", post);
    }
  }

  Future<void> refresh() {
    deleteControllers();
    posts.value = [];
    return Future.delayed(
      const Duration(milliseconds: 100),
      () async {
        await _getPosts(0);
      },
    );
  }

  @override
  Future<void> onEndScroll() async {
    // scrollReachedTop.value = false;
    await _getPosts(posts.length);
    return Future.delayed(
      const Duration(seconds: 0),
    );
  }

  @override
  Future<void> onTopScroll() {
    scrollReachedTop.value = true;
    return Future.delayed(
      const Duration(milliseconds: 100),
    );
  }
}
