library screens.news_feed;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodoodie/comments/comments.dart';
import 'package:foodoodie/helpers/utils/controller_util.dart';
import 'package:foodoodie/news_feed/controllers/post_controller.dart';
import 'package:foodoodie/recipe/recipe.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/theme/utils/app_buttons.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:foodoodie/watch/watch.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
export 'package:foodoodie/news_feed/news_feed_screen.dart';
export 'package:foodoodie/news_feed/controllers/news_feed_controller.dart';

part 'package:foodoodie/news_feed/widgets/post.dart';
part 'package:foodoodie/news_feed/widgets/title.dart';
part 'package:foodoodie/news_feed/widgets/actions.dart';
part 'package:foodoodie/news_feed/widgets/subtitle.dart';
part 'package:foodoodie/news_feed/widgets/owner_avatar.dart';
part 'package:foodoodie/news_feed/skeletons/post.dart';

class NewsFeed {
  static String get routeName => "/";

  static String postControllerName(String suffix) => "post_$suffix";

  ///widgets
  ///post
  static Widget post({required String postId, bool inPlay = false}) {
    return _Post(
      postId: postId,
      inPlay: inPlay,
    );
  }

  static Widget skeletonPost() {
    return const _Post.skeleton();
  }

  static _Routes get go => const _Routes();
}

class _Routes {
  const _Routes();

  void newsFeed() {
    // Get.until((route) {
    //   return Get.currentRoute == NewsFeed.routeName;
    // });

    // Get.back()
    Get.toNamed(
      NewsFeed.routeName,
      preventDuplicates: false,
    );
  }
}
