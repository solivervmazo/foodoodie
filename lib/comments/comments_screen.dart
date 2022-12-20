import 'package:flutter/material.dart';
import 'package:foodoodie/comments/comments.dart';
import 'package:foodoodie/comments/widgets/comment_widget.dart';
import 'package:foodoodie/comments/widgets/comments_actions_widget.dart';
import 'package:foodoodie/shared/layouts/bootstrap.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/theme/app_theme.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:get/get.dart';

class CommentsScreen extends GetView<CommentsController> {
  const CommentsScreen({super.key, required this.routeArgs});

  final Map<String, dynamic> routeArgs;

  AppBarWidget _appBar() {
    Widget leading = const BackWidget();

    Widget title = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppText("Comments").xLarge,
        ],
      ),
    );

    Widget action = Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.brown.shade800,
        child: const Text('AH'),
      ),
    );

    return AppBarWidget(
      leading: leading,
      title: title,
      action: action,
    );
  }

  @override
  Widget build(BuildContext context) {
    CommentsController controller = Get.find<CommentsController>(
        tag: Comments.getControllerName(routeArgs["postId"]));
    return Bootstrap(
      hasDrawer: false,
      appBar: _appBar(),
      hasBottomBar: false,
      body: Column(
        children: [
          Expanded(
            child: ScaffoldCardWidget(
              body: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.comments.length,
                  itemBuilder: (_, index) =>
                      CommentWidget(comment: controller.comments[index]),
                ),
              ),
            ),
          ),
          //comment
          const CommentsActionsWidget(),
        ],
      ),
    );
  }
}
