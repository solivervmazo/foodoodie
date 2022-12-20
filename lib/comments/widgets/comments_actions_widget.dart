import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/theme/utils/app_buttons.dart';
import 'package:foodoodie/shared/widgets.dart';

class CommentsActionsWidget extends StatelessWidget {
  const CommentsActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCardWidget(
      // padding: EdgeInsets.zero,
      body: Column(
        children: [
          Row(
            children: [
              //input
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: AppTheme.of(null).scaffoldBackgroundColor,
                  ),
                  child: Row(
                    children: [
                      AppButtons(
                        null,
                        icon: AppIcons.emoji(
                          color: AppTheme.ext(null).schemeLightColor,
                          size: 30,
                        ),
                        onTap: () {},
                      ).iconButton,
                      Expanded(
                        child: TextField(
                          style: const AppText("").regular.style,
                          clipBehavior: Clip.none,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const GapWidget.horizontal(5),
              //send
              AppButtons(
                null,
                icon: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: AppIcons.send(
                    color: AppTheme.ext(null).schemeSecondaryColor,
                    size: 30,
                  ),
                ),
                onTap: () {},
              ).iconButton,
              //emoji
            ],
          ),
        ],
        // color: Colors.red,
      ),
    );
  }
}
