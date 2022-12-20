import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/theme/utils/app_buttons.dart';
import 'package:get/get.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  static back() => Get.back();

  @override
  Widget build(BuildContext context) {
    return AppButtons(
      null,
      onTap: () => back(),
      icon: AppIcons.navigatorBack(
        size: 20.0,
      ),
    ).iconButton;
  }
}
