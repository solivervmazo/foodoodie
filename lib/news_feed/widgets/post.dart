part of screens.news_feed;

class _Post extends GetView<PostController> {
  // static final Widget _skeleton = const Text("data");

  const _Post({
    Key? key,
    required this.postId,
    this.inPlay = false,
    this.body,
  }) : super(key: key);

  const _Post.skeleton()
      : postId = "",
        inPlay = false,
        body = const _SkeletonPost();

  final String postId;
  final bool inPlay;

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final ctag = ControllerUtil.cTag("post", postId);
    return body ??
        ScaffoldCardWidget(
          padding: ScaffoldCardWidget.cardWidgetPadding.copyWith(
            bottom: 15.0,
          ),
          body: GetBuilder<PostController>(
            tag: ctag,
            builder: (controller) {
              return Column(
                children: [
                  _Title(
                    postId: postId,
                  ),
                  Watch.player(
                    postId: postId,
                    height: 300.0,
                    inPlay: inPlay,
                  ),
                  const GapWidget.vertical(10.0),
                  Row(
                    children: [
                      const AppText("Today 08:00pm").regular,
                      const Spacer(),
                      Obx(
                        () => AppButtons(
                          null,
                          text:
                              "${controller.post["interactions"]["views"]} views ${controller.inPlay} $postId",
                          onTap: () {},
                        ).textButton.dark,
                      ),
                      const AppText(" \u2022 ").regular,
                      AppButtons(
                        null,
                        text:
                            "${controller.post["interactions"]["comments"]} comments",
                        onTap: () {},
                      ).textButton.dark,
                    ],
                  ),
                  _Actions(
                    postId: postId,
                  ),
                ],
              );
            },
          ),
        );
  }
}
