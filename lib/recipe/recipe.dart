import 'package:get/get.dart';

export 'recipe_screen.dart';
export 'widgets/recipe_detail_widget.dart';
export 'widgets/recipe_instruction_widget.dart';
export 'controllers/recipe_controller.dart';

class Recipe {
  static String get routeName => "/recipe";

  static String getControllerName(String suffix) => "recipe_$suffix";

  static _RecipeRoutes get go => _RecipeRoutes();
}

class _RecipeRoutes {
  void recipe({Map<String, dynamic>? arguments}) {
    Get.toNamed(
      Recipe.routeName,
      arguments: arguments,
    );
  }
}
