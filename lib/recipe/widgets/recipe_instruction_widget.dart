import 'package:flutter/material.dart';
import 'package:foodoodie/recipe/recipe.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/theme/utils/app_buttons.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:get/get.dart';

class RecipeInstructionWidget extends GetView<RecipeController> {
  const RecipeInstructionWidget({
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
        expanded:
            controller.recipeViewMode.value == RecipeViewMode.ingredients ||
                controller.recipeViewMode.value == RecipeViewMode.steps,
        toggle: () => controller.setRecipeViewMode(
          controller.recipeGroupedViewMode.value,
        ),
        iconData: AppIcons.iconsData["openBook"],
        showTitleOnExpand: false,
        titleBuilder: (backgroundColor, foreGroundColor) => AppText(
          controller.recipeGroupedViewMode.value == RecipeViewMode.ingredients
              ? "Ingredients"
              : "Steps",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: foreGroundColor,
          ),
        ),
        builder: (backgroundColor, foregroundColor) => Obx(
          () => controller.recipe!.isEmpty
              ? AppText(
                  "No recipe provided",
                  style: TextStyle(
                    color: backgroundColor,
                  ),
                ).large
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 13.0,
                    horizontal: 5.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => AppText(
                          controller.recipeGroupedViewMode.value ==
                                  RecipeViewMode.ingredients
                              ? "Ingredients"
                              : "Steps",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: foregroundColor,
                          ),
                        ).large,
                      ),
                      const GapWidget.vertical(5.0),
                      Row(
                        children: [
                          AppButtons(
                            null,
                            text:
                                "Ingredients (${(controller.recipe!["ingredients"] as List).length})",
                            color: foregroundColor,
                            onTap: () => controller.setRecipeViewMode(
                              RecipeViewMode.ingredients,
                              toggle: false,
                            ),
                          ).textButton,
                          AppText(
                            " \u2022 ",
                            style: TextStyle(
                              color: AppTheme.ext(null).schemeTertiaryColor,
                            ),
                          ).regular,
                          AppButtons(
                            null,
                            text:
                                "Steps (${(controller.recipe!["steps"] as List).length})",
                            color: foregroundColor,
                            onTap: () => controller.setRecipeViewMode(
                              RecipeViewMode.steps,
                              toggle: false,
                            ),
                          ).textButton,
                        ],
                      ),
                      const GapWidget.vertical(10.0),
                      const Divider(),
                      Obx(
                        () => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          transitionBuilder: (child, animation) {
                            return SizeTransition(
                                sizeFactor: animation, child: child);
                          },
                          child: controller.recipeGroupedViewMode.value ==
                                  RecipeViewMode.ingredients
                              ? Column(
                                  children: List.generate(
                                    (controller.recipe!["ingredients"] as List)
                                                .length *
                                            2 -
                                        1,
                                    (index) => index.isOdd
                                        ? const GapWidget.vertical(8.0)
                                        : Text.rich(
                                            TextSpan(
                                              text:
                                                  "${controller.ingredientString(controller.recipe!["ingredients"][index ~/ 2]["name"], controller.recipe!["ingredients"][index ~/ 2]["quantity"])} ",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                                color: foregroundColor!
                                                    .withOpacity(0.7),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: controller.recipe![
                                                              "ingredients"]
                                                          [index - (index ~/ 2)]
                                                      ["preparation"],
                                                  style: TextStyle(
                                                    fontSize: 15.5,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppTheme.ext(null)
                                                        .onSurfaceColorDark,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                  ),
                                )
                              : Column(
                                  children: List.generate(
                                    (controller.recipe!["steps"] as List)
                                                .length *
                                            2 -
                                        1,
                                    (index) => index.isOdd
                                        ? const GapWidget.vertical(8.0)
                                        : Text.rich(
                                            TextSpan(
                                              text:
                                                  "Step ${(index - (index ~/ 2)) + 1} ",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                                color: foregroundColor!
                                                    .withOpacity(0.7),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: controller
                                                              .recipe!["steps"]
                                                          [index - (index ~/ 2)]
                                                      ["instruction"],
                                                  style: TextStyle(
                                                    fontSize: 15.5,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppTheme.ext(null)
                                                        .onSurfaceColorDark,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
