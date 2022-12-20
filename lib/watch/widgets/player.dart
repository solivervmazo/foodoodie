part of screens.watch;

const List<Map<String, dynamic>> steps = [
  {
    "duration": 100,
    "current": false,
  },
  {
    "duration": 200,
    "current": true,
  },
  {
    "duration": 200,
    "current": true,
  },
  {
    "duration": 200,
    "current": false,
  },
  {
    "duration": 200,
    "current": false,
  },
];

class _Player extends GetView<PlayerController> {
  const _Player({
    Key? key,
    required this.postId,
    this.watchMode = PlayerWatchMode.preview,
    this.height,
    this.inPlay = false,
  }) : super(key: key);

  final String postId;
  final PlayerWatchMode? watchMode;
  final double? height;
  final bool inPlay;

  @override
  Widget build(BuildContext context) {
    final ctag = "player_$postId";
    PlayerController controller = Get.find<PlayerController>(tag: ctag);
    return Container(
      height: height,
      color: AppTheme.ext(context).scaffoldCardColor,
      child: Stack(
        children: [
          GetBuilder<PlayerController>(
            tag: ctag,
            builder: (_) => Positioned.fill(
              child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: NetworkImage(
                        controller.nowDisplayingUrl.value.isNotEmpty
                            ? controller.nowDisplayingUrl.value
                            : controller.nowPlaying["cover"].toString(),
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _Actions(
              postId: postId,
              inPlay: inPlay,
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Visibility(
              visible: watchMode == PlayerWatchMode.fullscreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    // height: 80.0,
                    width: Get.width * 0.95,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                            top: 8.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.alarm,
                                size: 40.0,
                              ),
                              const GapWidget.horizontal(5.0),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Step 1",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Spacer(),
                                          Icon(
                                            FontAwesomeIcons.hourglassEnd,
                                            size: 14,
                                            color: AppTheme.ext(context)
                                                .onSurfaceColor,
                                          ),
                                          const GapWidget.horizontal(3.0),
                                          const Text(
                                            "30 mins",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "00:13:00 until next step",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                            bottom: 8.0,
                          ),
                          child: Row(
                            children: steps
                                .map(
                                  (step) => Expanded(
                                    flex: 1,
                                    child: ButtonWidget(
                                      padding: ButtonWidget.buttonWidgetPadding
                                          .copyWith(
                                        left: 1.0,
                                        right: 1.0,
                                      ),
                                      child: Container(
                                        height: 6.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    // return GetBuilder<PlayerController>(
    //   tag: id,
    //   initState: (_) {
    //     PostController postController = Get.find<PostController>();
    //     controller.cid = id;
    //     controller.nowPlaying = postController.post;
    //     controller.setNp("aaa");
    //     print("controller.nowPlaying ${controller.np}");
    //   },
    //   builder: (controller) => Container(
    //     height: height,
    //     color: AppTheme.ext(context).scaffoldCardColor,
    //     child: Stack(
    //       children: [
    //         Positioned.fill(
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: Colors.transparent,
    //               image: DecorationImage(
    //                 image: NetworkImage(
    //                   controller.nowDisplayingUrl.isNotEmpty
    //                       ? controller.nowDisplayingUrl
    //                       : controller.nowPlaying["cover"].toString(),
    //                 ),
    //                 fit: BoxFit.fitHeight,
    //               ),
    //             ),
    //             child: Text(
    //               "url($id): ${controller.np.value}",
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           left: 0,
    //           right: 0,
    //           bottom: 0,
    //           child: _Actions(
    //             id: controller.cid,
    //             onPlay: onPlay,
    //           ),
    //         ),
    //         //TODO widget cookking
    //         Positioned(
    //           top: 10,
    //           left: 0,
    //           right: 0,
    //           child: Visibility(
    //             visible: watchMode == PlayerWatchMode.fullscreen,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Container(
    //                   clipBehavior: Clip.hardEdge,
    //                   // height: 80.0,
    //                   width: Get.width * 0.95,
    //                   decoration: BoxDecoration(
    //                     color: AppTheme.of(context).primaryColor,
    //                     borderRadius: BorderRadius.circular(20.0),
    //                   ),
    //                   child: Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.only(
    //                           left: 15.0,
    //                           right: 15.0,
    //                           top: 8.0,
    //                         ),
    //                         child: Row(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             const Icon(
    //                               Icons.alarm,
    //                               size: 40.0,
    //                             ),
    //                             const GapWidget.horizontal(5.0),
    //                             Expanded(
    //                               child: Container(
    //                                 child: Column(
    //                                   crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                   children: [
    //                                     Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         const Text(
    //                                           "Step 1",
    //                                           style: TextStyle(
    //                                             fontSize: 16.0,
    //                                             fontWeight: FontWeight.w400,
    //                                           ),
    //                                         ),
    //                                         const Spacer(),
    //                                         Icon(
    //                                           FontAwesomeIcons.hourglassEnd,
    //                                           size: 14,
    //                                           color: AppTheme.ext(context)
    //                                               .onSurfaceColor,
    //                                         ),
    //                                         const GapWidget.horizontal(3.0),
    //                                         const Text(
    //                                           "30 mins",
    //                                           style: TextStyle(
    //                                             fontSize: 16.0,
    //                                             fontWeight: FontWeight.w400,
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                     const Text(
    //                                       "00:13:00 until next step",
    //                                       style: TextStyle(
    //                                         fontSize: 16.0,
    //                                         fontWeight: FontWeight.w500,
    //                                       ),
    //                                     )
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.only(
    //                           left: 15.0,
    //                           right: 15.0,
    //                           bottom: 8.0,
    //                         ),
    //                         child: Row(
    //                           children: steps
    //                               .map(
    //                                 (step) => Expanded(
    //                                   flex: 1,
    //                                   child: ButtonWidget(
    //                                     padding: ButtonWidget
    //                                         .buttonWidgetPadding
    //                                         .copyWith(
    //                                       left: 1.0,
    //                                       right: 1.0,
    //                                     ),
    //                                     child: Container(
    //                                       height: 6.0,
    //                                       decoration: BoxDecoration(
    //                                         color: Colors.white,
    //                                         borderRadius:
    //                                             BorderRadius.circular(3.0),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               )
    //                               .toList(),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
