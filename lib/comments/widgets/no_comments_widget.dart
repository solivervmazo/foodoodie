import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme.dart';

class NoCommentsWidget extends StatelessWidget {
  const NoCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcons.comment(
            color: AppTheme.ext(null).schemeLightColor,
            size: 70.0,
          ),
          AppText(
            "No available comments",
            style: TextStyle(
              color: AppTheme.ext(null).schemeLightColor,
            ),
          ).xLarge,
          AppText(
            "Be the first to comment",
            style: TextStyle(
              color: AppTheme.ext(null).schemeLightColor,
            ),
          ).regular,
        ],
      ),
    );
  }
}
