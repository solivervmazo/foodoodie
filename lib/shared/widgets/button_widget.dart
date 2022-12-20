import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme/app_theme.dart';

enum ButtonWidgetType { button, circular, text }

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.child,
    this.color,
    this.width,
    this.height,
    this.onTap,
    this.shape,
    this.padding,
    this.button,
    this.text,
  }) : buttonWidgetType = ButtonWidgetType.button;

  const ButtonWidget.circular({
    super.key,
    this.child = const SizedBox(),
    this.color,
    this.width,
    this.height,
    this.onTap,
    this.button,
    this.shape = const CircleBorder(),
    this.padding,
    this.text,
  }) : buttonWidgetType = ButtonWidgetType.circular;

  ButtonWidget.text({
    super.key,
    this.child = const SizedBox(),
    this.color,
    this.width,
    this.height,
    this.onTap,
    this.shape = const CircleBorder(),
    this.padding,
    required this.text,
    TextStyle? style,
  })  : buttonWidgetType = ButtonWidgetType.text,
        button = RichText(
          text: TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: text,
            style: color == null
                ? style
                : (style == null
                    ? TextStyle(color: color)
                    : style.copyWith(
                        color: color,
                      )),
          ),
        );

  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final ShapeBorder? shape;
  final EdgeInsets? padding;
  final Widget? button;
  final ButtonWidgetType buttonWidgetType;
  final String? text;

  Widget get _button => Material(
        type: color != null ? MaterialType.button : MaterialType.transparency,
        clipBehavior: Clip.hardEdge,
        shape: shape ?? const RoundedRectangleBorder(),
        color: color,
        child: SizedBox(
          width: _isCircular(shape) ? width ?? height : width,
          height: _isCircular(shape) ? height ?? width : height,
          child: InkWell(
            onTap: onTap,
            overlayColor: MaterialStateProperty.all<Color?>(
              AppTheme.ext(null).buttonOverlayColor,
            ),
            child: Padding(
              padding: _padding(padding),
              child: child,
            ),
          ),
        ),
      );

  ButtonWidget copyWith({
    Widget? child,
    Color? color,
    double? width,
    double? height,
    VoidCallback? onTap,
    ShapeBorder? shape,
    EdgeInsets? padding,
    String? text,
    TextStyle? style,
  }) {
    ButtonWidget widget = ButtonWidget(
      color: color ?? this.color,
      width: width ?? this.width,
      height: height ?? this.height,
      onTap: onTap ?? this.onTap,
      shape: shape ?? this.shape,
      padding: padding ?? this.padding,
      child: child ?? this.child,
    );
    switch (buttonWidgetType) {
      case ButtonWidgetType.text:
        widget = ButtonWidget.text(
          color: color ?? this.color,
          width: width ?? this.width,
          height: height ?? this.height,
          onTap: onTap ?? this.onTap,
          shape: shape ?? this.shape,
          padding: padding ?? this.padding,
          text: text ?? this.text,
          style: style,
          child: child ?? this.child,
        );
        break;
      case ButtonWidgetType.circular:
        break;
      default:
        break;
    }
    return widget;
  }

  static EdgeInsets get buttonWidgetPadding => const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 8.0,
        right: 8.0,
      );

  static EdgeInsets _padding(EdgeInsets? padding) =>
      padding ?? buttonWidgetPadding;

  static bool _isCircular(ShapeBorder? shape) =>
      shape is CircleBorder ? true : false;

  @override
  Widget build(BuildContext context) {
    return button ?? _button;
  }
}
