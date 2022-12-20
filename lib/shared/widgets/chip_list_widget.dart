import 'package:flutter/material.dart';

class ChipListWidget extends StatefulWidget {
  const ChipListWidget({
    Key? key,
    required this.itemBuilder,
    required this.separtorBuilder,
    required this.itemCount,
    required this.height,
  }) : super(key: key);

  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index) separtorBuilder;
  final int itemCount;
  final double? height;

  @override
  State<ChipListWidget> createState() => _ChipListWidgetState();
}

class _ChipListWidgetState extends State<ChipListWidget> {
  ScrollController scroll = ScrollController();
  bool showTrailing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        showTrailing = scroll.position.maxScrollExtent > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView.separated(
              controller: scroll,
              scrollDirection: Axis.horizontal,
              itemBuilder: widget.itemBuilder,
              separatorBuilder: widget.separtorBuilder,
              itemCount: widget.itemCount,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Visibility(
              visible: showTrailing,
              child: Container(
                width: 20.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black.withOpacity(0.01),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
