part of screens.news_feed;

class _Subtitle extends GetView<PostController> {
  const _Subtitle({
    Key? key,
    required this.postId,
  }) : super(key: key);

  final String postId;

  @override
  Widget build(BuildContext context) {
    final ctag = "post_$postId";
    return GetBuilder<PostController>(
      tag: ctag,
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  "${controller.post["cuisine"]} \u2022 ${controller.post["meal_type"]} \u2022 ${controller.post["prereq"]} \u2022 ",
                ).small,
              ],
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppIcons.hourglassEnd().small,
                AppText(
                  "${controller.post["duration"] ~/ 60} mins",
                ).small,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
