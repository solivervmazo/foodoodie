import 'package:flutter/material.dart';
import 'package:foodoodie/shared/layouts/bootstrap.dart';
import 'package:foodoodie/shared/theme/app_theme.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:foodoodie/news_feed/news_feed.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NewsFeedScreen extends GetView<NewsFeedController> {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find<NewsFeedController>();
    return Bootstrap(
      body: body,
    );
  }

  Widget get bottomBar => BottomAppBar(
        notchMargin: 5.0,
        color: AppTheme.ext(null).appBarColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.none,
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: controller.scrollIsForward.value ? 60 : 0,
          ),
        ),
      );

  Widget get floatingActionButton => Obx(
        () => Visibility(
          visible: controller.scrollIsForward.value,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.black87,
            foregroundColor: Colors.yellow,

            // mini: true,
            // elevation: 0,
            child: const Icon(Icons.add),
          ),
        ),
      );

  Widget get body => Column(
        children: [
          Expanded(
            child: Obx(
              () => RefreshIndicator(
                onRefresh: () async => await controller.refresh(),
                child: ScrollablePositionedList.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  // controller: controller.scroll,
                  addAutomaticKeepAlives: true,
                  physics:
                      controller.loadingStatus.value == LoadingStatus.loading
                          ? const NeverScrollableScrollPhysics()
                          : const ClampingScrollPhysics(),
                  itemCount: controller.posts.length,
                  itemScrollController: controller.itemScrollController,
                  itemPositionsListener: controller.itemPositionsListener,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const GapWidget.vertical(4.0),
                        controller.posts[index]["docId"] == ""
                            ? NewsFeed.skeletonPost()
                            : NewsFeed.post(
                                postId: controller.posts[index]["docId"],
                                inPlay: true,
                              ),
                        const GapWidget.vertical(4.0),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      );
}
