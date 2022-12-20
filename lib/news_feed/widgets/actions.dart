part of screens.news_feed;

class _Actions extends GetView<PostController> {
  const _Actions({
    Key? key,
    required this.postId,
  }) : super(key: key);

  final String postId;

  @override
  Widget build(BuildContext context) {
    final ctag = NewsFeed.postControllerName(postId);
    // Get.put<CommentsController>(
    //   CommentsController(),
    //   tag: Comments.getControllerName(postId),
    // );
    return GetBuilder<PostController>(
      tag: ctag,
      builder: (controller) => Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(
          top: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 4,
              child: AppButtons(
                const AppText("Comment").regular.dark,
                icon: AppIcons.comment().regular.dark,
                onTap: () => controller.goComments(),
              ).cardButton.primary,
            ),
            const GapWidget.horizontal(5),
            Flexible(
              flex: 4,
              child: AppButtons(
                const AppText("Read more").regular.dark,
                icon: AppIcons.recipe().regular.dark,
                onTap: () => controller.goRecipe(),
              ).cardButton.primary,
            ),
            const GapWidget.horizontal(5),
            Flexible(
              flex: 2,
              child: AppButtons(
                const AppText("").regular.dark,
                icon: AppIcons.favorite().regular.dark,
                onTap: () {},
              ).cardButton.favorites,
            ),
          ],
        ),
      ),
    );
  }
}
