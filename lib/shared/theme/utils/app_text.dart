import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme.dart';

class AppText extends Text {
  const AppText(
    super.data, {
    super.key,
    super.style,
    super.overflow,
  });

  TextStyle get textStyle => style!;

  AppTextMode get xLarge => AppTextMode(
        super.data ?? "",
        key: key,
        overflow: overflow,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppTheme.ext(null).textColor,
        ).merge(style),
      );

  AppTextMode get large => AppTextMode(
        super.data ?? "",
        key: key,
        overflow: overflow,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppTheme.ext(null).textColor,
        ).merge(style),
      );

  AppTextMode get regular => AppTextMode(
        super.data ?? "",
        key: key,
        overflow: overflow,
        style: style ??
            TextStyle(
              fontSize: 14,
              color: AppTheme.ext(null).textColor,
            ).merge(style),
      );

  AppTextMode get small => AppTextMode(
        super.data ?? "",
        key: key,
        overflow: overflow,
        style: TextStyle(
          fontSize: 13,
          color: AppTheme.ext(null).textColor,
        ).merge(style),
      );
}

class AppTextMode extends Text {
  const AppTextMode(super.data,
      {super.key, required super.style, super.overflow});

  Text get light => Text(
        data!,
        key: key,
        overflow: overflow,
        style: const TextStyle().merge(style).copyWith(
              color: AppTheme.ext(null).onSurfaceColorDark,
            ),
      );

  Text get dark => Text(
        data!,
        key: key,
        overflow: overflow,
        style: const TextStyle().merge(style).copyWith(
              color: AppTheme.ext(null).onSurfaceColor,
            ),
      );
}
