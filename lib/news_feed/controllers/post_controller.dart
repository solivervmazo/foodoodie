import 'package:foodoodie/comments/comments.dart';
import 'package:foodoodie/recipe/recipe.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final RxMap<String, dynamic> post = <String, dynamic>{}.obs;
  final RxBool inPlay = false.obs;

  void setPost(String cid, Map<String, dynamic> post) {
    this.post.value = post;
  }

  void toggleInPlay(String cid, bool inPlay) {
    this.inPlay.value = inPlay;
  }

  void goComments() {
    Get.put<CommentsController>(
      CommentsController(),
      tag: Comments.getControllerName("${post["docId"]}"),
    );
    Get.toNamed(Comments.routeName, arguments: {"postId": post["docId"]});
  }

  void goRecipe() {
    // Get.put<CommentsController>(
    //   CommentsController(),
    //   tag: Comments.getControllerName("${post["docId"]}"),
    // );
    Recipe.go.recipe(arguments: {"postId": post["docId"]});
  }
}
