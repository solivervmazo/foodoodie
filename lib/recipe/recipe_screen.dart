import 'package:flutter/material.dart';
import 'package:foodoodie/dev/test_data.dart';
import 'package:foodoodie/recipe/recipe.dart';
import 'package:foodoodie/shared/layouts/bootstrap.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/theme/utils/app_buttons.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:get/get.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

class RecipeScreen extends GetView<RecipeController> {
  const RecipeScreen({super.key, this.routeArgs});

  final Map<String, dynamic>? routeArgs;

  AppBarWidget _appBar() {
    Widget leading = const BackWidget();

    Widget title = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppText("Read more").xLarge,
        ],
      ),
    );

    Widget action = Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.brown.shade800,
        child: const Text('AH'),
      ),
    );

    return AppBarWidget(
      leading: leading,
      title: title,
      action: action,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Bootstrap(
      appBar: _appBar(),
      hasDrawer: false,
      hasBottomBar: false,
      body: Column(
        children: [
          Expanded(
            child: ScaffoldCardWidget(
              body: ScaffoldCardWidget(
                body: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppTheme.ext(null).schemeLightColor,
                          ),
                        ),
                        AppButtons(
                          null,
                          onTap: () {},
                          icon: AppIcons.optionsThreeDots(
                            color: AppTheme.ext(null).schemeSecondaryColor,
                          ).large,
                        ).iconButton,
                      ],
                    ),
                    const GapWidget.vertical(5.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: const [
                            RecipeDetailWidget(),
                            //Recipe
                            GapWidget.vertical(20.0),
                            RecipeInstructionWidget(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
