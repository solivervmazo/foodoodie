import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme/themes/main_theme.dart';
import 'package:get/get.dart';

export 'package:foodoodie/shared/theme/utils/app_text.dart';

class AppTheme extends GetxController {
  AppTheme._();

  static final AppTheme _appTheme = AppTheme._();

  static AppTheme get instance => _appTheme;

  static MainTheme ext(BuildContext? context) =>
      Theme.of(context ?? Get.context!).extension<MainTheme>()!;

  static ThemeData of(BuildContext? context) =>
      Theme.of(context ?? Get.context!);

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    extensions: const <ThemeExtension<dynamic>>[
      MainTheme.light(),
    ],
    scaffoldBackgroundColor: const Color(0xFFD1CFCF),
    primaryColor: const Color(0xFF97DECC),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    extensions: const <ThemeExtension<dynamic>>[
      MainTheme.dark(),
    ],
    primaryColor: const Color(0xFF69998E),
  );
}
