import 'package:foodoodie/comments/comments.dart';
import 'package:foodoodie/news_feed/controllers/news_feed_controller.dart';
import 'package:foodoodie/news_feed/controllers/post_controller.dart';
import 'package:foodoodie/shared/controllers/bootstrap_controller.dart';
import 'package:foodoodie/watch/controllers/player_controller.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NewsGeneratorMiddleware extends GetMiddleware {
  late NewsFeedController newsFeedController;

  @override
  int? get priority => 1;

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    _Bindings().dependencies();
    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    // Get.put<PostController>(PostController());
    // Get.put<PlayerController>(PlayerController());
    // Get.put<CommentsController>(CommentsController());
    newsFeedController = Get.find<NewsFeedController>();
    newsFeedController.deleteControllers();
    newsFeedController.assignControllers(newsFeedController.posts, 0);
    newsFeedController.itemScrollController = ItemScrollController();
    return super.onPageBuildStart(page);
  }
}

class _Bindings implements Bindings {
  @override
  void dependencies() {
    Get.put<BootstrapController>(BootstrapController());
    Get.put<NewsFeedController>(NewsFeedController());
    // Get.put<PostController>(PostController());
    // Get.put<PlayerController>(PlayerController());
    // Get.put<CommentsController>(CommentsController());
  }
}
