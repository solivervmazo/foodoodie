import 'package:flutter/material.dart';
import 'package:foodoodie/comments/comments.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/theme/utils/app_buttons.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:get/get.dart';

class CommentWidget extends GetView<CommentsController> {
  const CommentWidget({super.key, required this.comment});

  final Map<String, dynamic> comment;

  @override
  Widget build(BuildContext context) {
    return ScaffoldCardWidget(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  radius: 15,
                  child: Text(
                      "${comment["user"].toString().substring(0, 2).capitalize}"),
                ),
              ),
              const GapWidget.horizontal(10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppText("${comment["user"]}").regular,
                        const GapWidget.horizontal(10.0),
                        Expanded(
                          child: Divider(
                            color: AppTheme.ext(null).schemeLightColor,
                          ),
                        ),
                        AppButtons(
                          null,
                          onTap: () {},
                          icon: AppIcons.commentReply(
                            color: AppTheme.ext(null).schemeSecondaryColor,
                          ).large,
                        ).iconButton,
                        AppButtons(
                          null,
                          onTap: () {},
                          icon: AppIcons.optionsThreeDots(
                            color: AppTheme.ext(null).schemeSecondaryColor,
                          ).large,
                        ).iconButton,
                      ],
                    ),
                    AppText(
                      comment["comment"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ).regular,
                    const GapWidget.vertical(10.0),
                    Row(
                      children: [
                        const Spacer(),
                        AppText("${comment["commentedDate"]}").small,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
