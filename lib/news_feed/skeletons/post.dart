part of screens.news_feed;

class _SkeletonPost extends StatelessWidget {
  const _SkeletonPost({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCardWidget(
      padding: ScaffoldCardWidget.cardWidgetPadding.copyWith(
        bottom: 15.0,
      ),
      body: Column(
        children: [
          //title
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
                              child: SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    padding: EdgeInsets.zero,
                                    lines: 2,
                                    spacing: 2,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: true,
                                      height: 15,
                                      borderRadius: BorderRadius.circular(8),
                                      minLength:
                                          MediaQuery.of(context).size.width / 2,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const GapWidget.vertical(2.0),
                        Row(
                          children: [
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                  height: 10,
                                  width: 40,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            const GapWidget.horizontal(4.0),
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                  height: 10,
                                  width: 40,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            const GapWidget.horizontal(4.0),
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                  height: 10,
                                  width: 40,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const GapWidget.horizontal(8.0),
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    shape: BoxShape.circle,
                    width: 45,
                    height: 45,
                  ),
                ),
              ],
            ),
          ),
          //watch
          const GapWidget.vertical(10.0),
          Row(
            children: [
              Expanded(
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 300,
                    // width: 60,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          const GapWidget.vertical(10.0),
          Row(
            children: [
              SkeletonLine(
                style: SkeletonLineStyle(
                    height: 11,
                    width: 60,
                    borderRadius: BorderRadius.circular(8)),
              ),
              const Spacer(),
              SkeletonLine(
                style: SkeletonLineStyle(
                    height: 11,
                    width: 120,
                    borderRadius: BorderRadius.circular(8)),
              )
            ],
          ),
          const GapWidget.vertical(10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 40,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const GapWidget.horizontal(5.0),
              Flexible(
                flex: 1,
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 40,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const GapWidget.horizontal(5.0),
              Flexible(
                flex: 1,
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 40,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
