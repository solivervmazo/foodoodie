import 'package:flutter/material.dart';

@immutable
class MainTheme extends ThemeExtension<MainTheme> {
  const MainTheme({
    this.onSurfaceColorDark,
    this.onSurfaceColor,
    this.textColor,
    this.searchButtonColor,
    this.splashColor,
    this.scaffoldCardColor,
    this.appBarColor,
    this.inputButtonColor,
    this.buttonOverlayColor,
    this.inputButtonOverlayColor,
    this.schemePrimaryColor,
    this.schemeFavoriteColor,
    this.schemeDarkColor,
    this.schemeLightColor,
    this.schemeSecondaryColor,
    this.schemeTertiaryColor,
  });

  /// Colors
  final Color? onSurfaceColorDark;
  final Color? onSurfaceColor;
  final Color? textColor;
  final Color? searchButtonColor;
  final Color? splashColor;
  final Color? scaffoldCardColor;
  final Color? appBarColor;
  final Color? inputButtonColor;
  final Color? buttonOverlayColor;
  final Color? inputButtonOverlayColor;
  final Color? schemePrimaryColor;
  final Color? schemeFavoriteColor;
  final Color? schemeDarkColor;
  final Color? schemeLightColor;
  final Color? schemeSecondaryColor;
  final Color? schemeTertiaryColor;

  const MainTheme.light()
      : onSurfaceColor = const Color(0xFFFFFFFF),
        onSurfaceColorDark = const Color(0xFF000000),
        searchButtonColor = const Color(0xC7E5E5F7),
        splashColor = const Color.fromARGB(229, 101, 185, 3),
        scaffoldCardColor = const Color(0xFFFFFFFF),
        appBarColor = const Color(0xFF97DECC),
        inputButtonColor = const Color(0xFFFFFFFF),
        buttonOverlayColor = const Color.fromARGB(229, 220, 227, 234),
        inputButtonOverlayColor = const Color(0xFFFFFFFF),
        textColor = const Color(0xFF000000),
        schemePrimaryColor = const Color(0xFF63AB1C),
        schemeFavoriteColor = const Color(0xFFFF395D),
        schemeDarkColor = const Color(0xFF000000),
        schemeLightColor = const Color(0xFFABADAD),
        schemeSecondaryColor = const Color(0xFF67D8BC),
        schemeTertiaryColor = const Color(0xFF397062);

  const MainTheme.dark()
      : onSurfaceColor = const Color(0xFFFFFFFF),
        onSurfaceColorDark = const Color(0xFF000000),
        searchButtonColor = const Color(0xC8CDCFFF),
        splashColor = const Color(0xC8CDCFFF),
        scaffoldCardColor = const Color(0xC5161618),
        appBarColor = const Color(0xC5161618),
        inputButtonColor = const Color(0xFF353434),
        buttonOverlayColor = const Color.fromARGB(155, 146, 207, 192),
        inputButtonOverlayColor = const Color(0xFFFFFFFF),
        textColor = const Color(0xFFFFFFFF),
        schemePrimaryColor = const Color(0xFF4F8817),
        schemeFavoriteColor = const Color(0xFFCE3A55),
        schemeDarkColor = const Color(0xFFFFFFFF),
        schemeLightColor = const Color(0xFFABADAD),
        schemeSecondaryColor = const Color(0xFF5DC4AA),
        schemeTertiaryColor = const Color(0xFF3E806F);

  @override
  MainTheme copyWith({
    Color? onSurfaceColor,
    Color? searchButtonColor,
    Color? splashColor,
  }) {
    return MainTheme(
      onSurfaceColor: onSurfaceColor ?? this.onSurfaceColor,
      searchButtonColor: searchButtonColor ?? this.searchButtonColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  MainTheme lerp(ThemeExtension<MainTheme>? other, double t) {
    if (other is! MainTheme) {
      return this;
    }
    return MainTheme(
      onSurfaceColor: Color.lerp(onSurfaceColor, other.onSurfaceColor, t),
      searchButtonColor:
          Color.lerp(searchButtonColor, other.searchButtonColor, t),
      splashColor: Color.lerp(splashColor, other.splashColor, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $searchButtonColor)';
}
