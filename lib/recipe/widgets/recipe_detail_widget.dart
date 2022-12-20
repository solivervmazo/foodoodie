import 'package:flutter/material.dart';
import 'package:foodoodie/dev/test_data.dart';
import 'package:foodoodie/recipe/recipe.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:get/get.dart';

class RecipeDetailWidget extends GetView<RecipeController> {
  const RecipeDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DialogCardWidget(
        backgroundColor: DialogCardWidget.backgroundScheme(
          light: AppTheme.ext(null).schemeSecondaryColor,
        ),
        foregroundColor: DialogCardWidget.foregroundScheme(
          light: AppTheme.ext(null).schemeTertiaryColor,
          dark: AppTheme.ext(null).onSurfaceColor,
        ),
        expanded: controller.recipeViewMode.value == RecipeViewMode.description,
        toggle: () => controller.setRecipeViewMode(
          RecipeViewMode.description,
        ),
        iconData: AppIcons.iconsData["menuList"],
        showTitleOnExpand: false,
        titleBuilder: (backgroundColor, foreGroundColor) => Obx(
          () => AppText(
            controller.recipe!["description"],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: foreGroundColor,
            ),
          ),
        ),
        builder: (backgroundColor, foregroundColor) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppText(
                    "Cuisines ",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: foregroundColor,
                    ),
                  ).regular,
                  Expanded(
                    child: ChipListWidget(
                      itemCount: 3,
                      height: 22.0,
                      itemBuilder: (context, index) => ChipWidget(
                        "Chinese",
                        backgroundColor: backgroundColor,
                        foregroundColor: foregroundColor,
                      ),
                      separtorBuilder: (context, index) =>
                          const GapWidget.horizontal(5.0),
                    ),
                  ),
                ],
              ),
              const GapWidget.vertical(5.0),
              Row(
                children: [
                  AppText(
                    "Meal type ",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: foregroundColor,
                    ),
                  ).regular,
                  Expanded(
                    child: ChipListWidget(
                      itemCount: 1,
                      height: 22.0,
                      itemBuilder: (context, index) => ChipWidget(
                        "Any",
                        backgroundColor: backgroundColor,
                        foregroundColor: foregroundColor,
                      ),
                      separtorBuilder: (context, index) =>
                          const GapWidget.horizontal(5.0),
                    ),
                  ),
                ],
              ),
              const GapWidget.vertical(10.0),
              const Divider(),
              Obx(
                () => AppText(
                  controller.recipe!["description"] ?? "",
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                    color: foregroundColor,
                  ),
                ).regular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
