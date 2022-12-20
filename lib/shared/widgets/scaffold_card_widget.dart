import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme/app_theme.dart';

class ScaffoldCardWidget extends StatelessWidget {
  const ScaffoldCardWidget({
    super.key,
    this.body,
    this.padding,
    this.color,
  });

  final Widget? body;
  final EdgeInsets? padding;
  final Color? color;
  // late Widget? base;

  static EdgeInsets get cardWidgetPadding => const EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
        left: 15.0,
        right: 15.0,
      );

  static EdgeInsets _padding(EdgeInsets? padding) =>
      padding ?? cardWidgetPadding;

  // ScaffoldCardWidget.column(
  //   List<Widget>? children, {
  //   super.key,
  //   Widget? column,
  //   MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  //   CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  //   MainAxisSize mainAxisSize = MainAxisSize.min,
  // })  : body = column ??
  //           Column(
  //             mainAxisAlignment: mainAxisAlignment,
  //             crossAxisAlignment: crossAxisAlignment,
  //             mainAxisSize: mainAxisSize,
  //             children: children ?? <Widget>[],
  //           ),
  //       padding = _padding(null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding(padding),
      //*theme card scaffold card
      decoration: BoxDecoration(
        color: color ?? AppTheme.ext(context).scaffoldCardColor,
      ),
      child: body,
    );
  }
}
