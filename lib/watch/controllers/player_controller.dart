import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PlayerStatus { clean, playing, paused, done }

class PlayerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxMap<String, dynamic> nowPlaying = <String, dynamic>{}.obs;
  RxString nowDisplayingUrl = "".obs;
  RxBool inPlay = false.obs;
  RxDouble playerTick = 0.0.obs;
  Rx<PlayerStatus> playerStatus = PlayerStatus.clean.obs;
  RxInt contentsLength = 0.obs;
  Rx<int?> contentCurrenIndex = Rx<int?>(0);

  late AnimationController _animationController;
  late Animation _animation;

  final double picIntervalInMilliseconds = 10000;

  @override
  void onReady() {
    toggleInPlay("", inPlay: inPlay.value, index: contentCurrenIndex.value);
    super.onReady();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  void _getContents() {
    contentsLength.value = ((nowPlaying["contents"] ?? []) as List).length;
  }

  void _startPlaying() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: (picIntervalInMilliseconds ~/ 1000) * contentsLength.value,
      ),
    );

    _animation = Tween<double>(
            begin: 0.0,
            end: picIntervalInMilliseconds * contentsLength.value.toDouble())
        .animate(_animationController)
      ..addListener(
        () {
          playerTick.value = _animationController.value;
          if (_animation.value >=
              picIntervalInMilliseconds * contentsLength.value.toDouble()) {
            playerStatus.value = PlayerStatus.done;
          }
        },
      );
  }

  void setNowPlaying(String cid, Map<String, dynamic> nowPlaying) {
    this.nowPlaying.value = nowPlaying;
  }

  void setNowDisplayingUrl(String nowDisplayingUrl, {int? index}) {
    this.nowDisplayingUrl.value = nowDisplayingUrl;
    contentCurrenIndex.value = index;
    toggleInPlay("", inPlay: true, index: index);
  }

  void togglePrevNextDisplaying({required int direction}) {
    if (direction >= 0) {
      if ((contentCurrenIndex.value ?? 0) < contentsLength.value - 1) {
        contentCurrenIndex.value = contentCurrenIndex.value! + 1;
      }
    } else {
      if ((contentCurrenIndex.value ?? contentsLength.value) > 0) {
        contentCurrenIndex.value = contentCurrenIndex.value! - 1;
      }
    }

    setNowDisplayingUrl(
      "${nowPlaying["contents"][contentCurrenIndex.value ?? 0]["imgUrl"]}",
      index: contentCurrenIndex.value,
    );
  }

  void replay() {
    setNowDisplayingUrl(
      "${nowPlaying["contents"][0]["imgUrl"]}",
      index: 0,
    );
  }

  void toggleInPlay(String cid, {bool inPlay = false, int? index}) {
    if (playerStatus.value == PlayerStatus.clean) {
      _getContents();
      _startPlaying();
    }
    if (playerStatus.value == PlayerStatus.clean ||
        playerStatus.value == PlayerStatus.playing ||
        playerStatus.value == PlayerStatus.paused) {
      if (inPlay) {
        if (index != null) {
          _animationController.forward(
            from: (1 / contentsLength.value) * (index),
          );
        } else {
          _animationController.forward();
        }
        playerStatus.value = PlayerStatus.playing;
      } else {
        _animationController.stop();
        playerStatus.value = PlayerStatus.paused;
      }
      this.inPlay.value = inPlay;
    } else {
      playerStatus.value = PlayerStatus.playing;

      _animationController.forward(from: 0);
    }
  }
}
