import 'package:flutter/material.dart';
import 'package:foodoodie/dev/test_scaffold_widget.dart';
import 'package:foodoodie/watch/controllers/watch_controller.dart';
import 'package:foodoodie/shared/layouts/bootstrap.dart';
import 'package:foodoodie/watch/watch.dart';
import 'package:get/get.dart';

class WatchScreen extends GetView<WatchController> {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Bootstrap(
      // blank: true,
      // body: Watch.player(
      //   watchMode: PlayerWatchMode.fullscreen,
      // ),
      body: TestScaffoldWidget(),
    );
  }
}
