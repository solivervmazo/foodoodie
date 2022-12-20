part of screens.news_feed;

class _Title extends GetView<PostController> {
  const _Title({
    Key? key,
    required this.postId,
  }) : super(key: key);

  final String postId;

  @override
  Widget build(BuildContext context) {
    final ctag = "post_$postId";
    return GetBuilder<PostController>(
      tag: ctag,
      // assignId: true,
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text.rich(
                                TextSpan(
                                  text: controller.post["title"],
                                  style: const AppText("").xLarge.style,
                                  children: [
                                    TextSpan(
                                      text: " \u2022 ",
                                      style: const AppText("").xLarge.style,
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer(),
                                      text: "Solvier Mazo",
                                      style: const AppText("").large.style,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        _Subtitle(
                          postId: postId,
                        ),
                      ],
                    ),
                  ),
                ),
                const GapWidget.horizontal(8.0),
                const _OwnerAvatar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
