import 'package:foodoodie/comments/comments.dart';
import 'package:foodoodie/explore/explore.dart';
import 'package:foodoodie/news_feed/controllers/post_controller.dart';
import 'package:foodoodie/news_feed/middlewares/news_generator_middleware.dart';
import 'package:foodoodie/news_feed/news_feed.dart';
import 'package:foodoodie/profile/controllers/profile_controller.dart';
import 'package:foodoodie/profile/profile.dart';
import 'package:foodoodie/recipe/recipe.dart';
import 'package:foodoodie/shared/controllers/bootstrap_controller.dart';
import 'package:foodoodie/watch/controllers/player_controller.dart';
import 'package:foodoodie/watch/controllers/watch_controller.dart';
import 'package:foodoodie/watch/watch.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> routes() => [
        GetPage(
            name: NewsFeed.routeName,
            page: () => const NewsFeedScreen(),
            // binding: BindingsBuilder(() {
            //   Get.put<BootstrapController>(BootstrapController());
            //   Get.put<NewsFeedController>(NewsFeedController());
            //   Get.put<PostController>(PostController());
            //   Get.put<PlayerController>(PlayerController());
            //   Get.put<CommentsController>(CommentsController());
            // }),
            transition: Transition.rightToLeft,
            middlewares: [
              NewsGeneratorMiddleware(),
            ]),
        GetPage(
          name: Watch.route,
          page: () => const WatchScreen(),
          binding: BindingsBuilder(() {
            Get.put<WatchController>(WatchController());
          }),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Comments.routeName,
          page: () => CommentsScreen(
            routeArgs: Get.arguments,
          ),
          binding: BindingsBuilder(() {
            Get.put<CommentsController>(CommentsController());
          }),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: Profile.routeName,
          page: () => const ProfileScreen(),
          binding: BindingsBuilder(() {
            Get.put<ProfileController>(ProfileController());
          }),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: Recipe.routeName,
          page: () => RecipeScreen(
            routeArgs: Get.arguments,
          ),
          binding: BindingsBuilder(() {
            Get.put<RecipeController>(RecipeController());
          }),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: Explore.routeName,
          page: () => const ExploreScreen(),
          // binding: BindingsBuilder(() {
          //   Get.put<RecipeController>(RecipeController());
          // }),
          transition: Transition.downToUp,
        ),
      ];
}
