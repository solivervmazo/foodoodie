import 'package:flutter/material.dart';
import 'package:foodoodie/shared/theme.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget(
    this.data, {
    Key? key,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  final String data;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            BorderRadius.circular(
              12.0,
            ),
        color: backgroundColor,
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 3.0,
              horizontal: 8.0,
            ),
        child: AppText(
          data,
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
            color: foregroundColor,
          ),
        ).regular,
      ),
    );
  }
}
