export 'comments_screen.dart';
export 'controllers/comments_controller.dart';

class Comments {
  static String get routeName => "/comments";
  static String getControllerName(String suffix) => "comments_$suffix";
}
