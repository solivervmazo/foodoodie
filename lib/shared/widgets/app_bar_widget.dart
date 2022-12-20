import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  const AppBarWidget({
    super.key,
    this.leading,
    this.title,
    this.action,
    this.padding,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? action;
  final EdgeInsets? padding;

  static EdgeInsets _padding(EdgeInsets? padding) =>
      padding ??
      const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      );

  static Widget _leading(Widget? leading) => leading ?? const SizedBox();

  static Widget _title(Widget? title) => title ?? const SizedBox();

  static Widget _action(Widget? action) => action ?? const SizedBox();

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Widget get child => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppTheme.ext(null).appBarColor,
        ),
        child: Padding(
          padding: _padding(padding),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _leading(leading),
              _title(title),
              _action(action),
            ],
          ),
        ),
      );

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        80.0,
      );
}
