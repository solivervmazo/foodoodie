import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoodie/shared/theme.dart';
import 'package:foodoodie/shared/widgets.dart';

class AppButtons extends ButtonWidget {
  final Text? data;
  final Widget? icon;
  final IconData? iconData;
  final String? text;

  ///usable only on textType

  const AppButtons(
    this.data, {
    super.key,
    this.icon,
    super.color,
    super.onTap,
    this.iconData,
    this.text,
  }) : super(child: data);

  ///CardButton
  AppButtonColor get cardButton => AppButtonColor(
        color: color,
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        padding: ButtonWidget.buttonWidgetPadding.copyWith(
          top: 15,
          bottom: 15,
          left: 15,
          right: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon ?? const SizedBox(),
            icon != null ? const GapWidget.horizontal(5) : const SizedBox(),
            data!
          ],
        ),
      );

  ///TextButton
  AppButtonColor get textButton => AppButtonColor.text(
        text: text ?? "aa",
        color: color,
        onTap: onTap,
      );

  //IconButton
  AppButtonColor get iconButton => AppButtonColor.circular(
        onTap: onTap,
        child: icon,
      );
}

class AppButtonColor extends ButtonWidget {
  const AppButtonColor({
    required super.child,
    super.key,
    super.color,
    super.width,
    super.height,
    super.onTap,
    super.shape,
    super.padding,
  });

  AppButtonColor.text({
    super.child,
    super.key,
    super.color,
    super.width,
    super.height,
    super.onTap,
    super.shape,
    super.padding,
    required String text,
    TextStyle? style,
  }) : super.text(text: text, style: style);

  const AppButtonColor.circular(
      {super.key,
      super.color,
      super.width,
      super.height,
      super.onTap,
      super.shape,
      super.padding,
      Widget? child})
      : super.circular(child: child);

  ButtonWidget get dark => copyWith(
        color: color ?? AppTheme.ext(null).schemeDarkColor,
      );

  ButtonWidget get primary => copyWith(
        color: color ?? AppTheme.ext(null).schemePrimaryColor,
      );

  ///special cases
  ButtonWidget get favorites => copyWith(
        color: color ?? AppTheme.ext(null).schemeFavoriteColor,
      );
}

class AppButtonsSize {}
