const String _concatinator = "_";

mixin ControllerUtil {
  static String cTag(String prefix, String suffix) =>
      "$prefix$_concatinator$suffix";
}
