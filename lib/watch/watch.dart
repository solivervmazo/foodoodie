library screens.watch;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoodie/news_feed/controllers/post_controller.dart';
import 'package:foodoodie/shared/theme/app_theme.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:foodoodie/watch/controllers/player_controller.dart';
import 'package:get/get.dart';

export 'package:foodoodie/watch/watch_screen.dart';

part 'package:foodoodie/watch/widgets/player.dart';
part 'package:foodoodie/watch/widgets/actions.dart';

enum PlayerWatchMode { preview, fullscreen }

class Watch {
  static String get route => "/watch";

  static Widget player({
    required String postId,
    double? height,
    PlayerWatchMode? watchMode,
    bool inPlay = false,
  }) =>
      _Player(
        postId: postId,
        height: height,
        watchMode: watchMode,
        inPlay: inPlay,
      );
}
