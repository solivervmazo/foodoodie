import 'package:flutter/material.dart';

class GapWidget extends StatelessWidget {
  const GapWidget({super.key, this.width, this.height});
  final double? width;
  final double? height;

  const GapWidget.horizontal(double size, {super.key})
      : width = size,
        height = null;

  const GapWidget.vertical(double size, {super.key})
      : width = null,
        height = size;

  @override
  Widget build(BuildContext context) {
    return height == null
        ? SizedBox(
            width: width,
          )
        : SizedBox(
            height: height,
          );
  }
}
