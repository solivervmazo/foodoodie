part of screens.watch;

class _Actions extends GetView<PlayerController> {
  const _Actions({
    Key? key,
    required this.postId,
    this.extension,
    this.inPlay = false,
  }) : super(key: key);

  final String postId;
  final bool inPlay;

  final Widget? extension;

  @override
  Widget build(BuildContext context) {
    final ctag = "player_$postId";
    return GetBuilder<PlayerController>(
      tag: ctag,
      builder: (controller) => Container(
        color: Colors.black.withOpacity(0.6),
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 6.0,
        ),
        // height: 6.0,
        child: Column(
          children: [
            Obx(
              () => LinearProgressIndicator(
                value: controller.playerTick.value,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                //*widget play ratings views
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.togglePrevNextDisplaying(direction: -1);
                          },
                          child: const Icon(
                            Icons.fast_rewind_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const GapWidget.horizontal(8.0),
                        GestureDetector(
                          onTap: () =>
                              controller.playerStatus.value == PlayerStatus.done
                                  ? controller.replay()
                                  : controller.toggleInPlay(
                                      "",
                                      inPlay: !controller.inPlay.value,
                                    ),
                          child: Obx(
                            () => Icon(
                              controller.playerStatus.value == PlayerStatus.done
                                  ? Icons.replay_outlined
                                  : (controller.playerStatus.value ==
                                          PlayerStatus.playing
                                      ? FontAwesomeIcons.circlePause
                                      : FontAwesomeIcons.circlePlay),
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                        const GapWidget.horizontal(8.0),
                        GestureDetector(
                          onTap: () {
                            controller.togglePrevNextDisplaying(direction: 1);
                          },
                          child: const Icon(
                            Icons.fast_forward_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const GapWidget.horizontal(5.0),
                        //*widget ratings
                        Expanded(
                          child: SizedBox(
                            height: 40.0,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) => Container(
                                height: 40,
                                width: 40,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(
                                    5.0,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller.nowPlaying["contents"][index]
                                          ["imgUrl"],
                                    ),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.setNowDisplayingUrl(
                                            controller.nowPlaying["contents"]
                                                [index]["imgUrl"],
                                            index: index,
                                          );
                                        },
                                        child: Container(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder: (_, index) =>
                                  const GapWidget.horizontal(
                                5.0,
                              ),
                              itemCount: (controller.nowPlaying["contents"]
                                      as List<Map<String, dynamic>>)
                                  .length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
