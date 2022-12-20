import 'package:foodoodie/dev/test_data.dart';
import 'package:foodoodie/news_feed/news_feed.dart';
import 'package:get/get.dart';

enum RecipeViewMode {
  description,
  ingredients,
  steps,
  none,
}

class RecipeController extends GetxController {
  final Rx<LoadingStatus> loadingStatus = LoadingStatus.none.obs;
  final RxMap<String, dynamic> args = <String, dynamic>{}.obs;
  final RxMap<String, dynamic>? recipe = <String, dynamic>{}.obs;
  final Rx<RecipeViewMode> recipeViewMode = RecipeViewMode.description.obs;
  final Rx<RecipeViewMode> recipeGroupedViewMode =
      RecipeViewMode.ingredients.obs;

  @override
  void onReady() {
    _getArgs();
    _getRecipe(0);
    super.onReady();
  }

  void _getArgs() {
    args.value = Get.arguments ?? <String, dynamic>{};
  }

  void setRecipeViewMode(RecipeViewMode recipeViewMode, {bool toggle = true}) {
    List<RecipeViewMode> group = [
      RecipeViewMode.ingredients,
      RecipeViewMode.steps,
    ];

    if (group.contains(recipeViewMode)) {
      recipeGroupedViewMode.value = recipeViewMode;
    }

    this.recipeViewMode.value = this.recipeViewMode.value == recipeViewMode
        ? (toggle ? RecipeViewMode.none : recipeViewMode)
        : recipeViewMode;
  }

  String ingredientString(String name, String qty) {
    return "$qty $name";
  }

  Future<void> _getRecipe(int next) {
    if (args["postId"] == null) {
      return Future.delayed(const Duration(milliseconds: 0));
    }
    loadingStatus.value = LoadingStatus.loading;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () {
        var data = testGenerateRecipe(args["postId"]);
        if (data != null) {
          recipe!.value = data;
        }
        loadingStatus.value = LoadingStatus.success;
        print(recipe);
      },
    );
  }
}
